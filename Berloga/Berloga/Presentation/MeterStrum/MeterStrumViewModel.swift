//
//  MeterStrumViewModel.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 05.05.2023.
//

import Foundation

//MARK: - Change Indication Status enum

enum IndicationStatus {
    case add
    case change
    case delete
    case none
}

//MARK: - MeterStrumViewModelInterface

protocol MeterStrumViewModelInterface {
    
    var tableData: Binding<[(section: String, row: [MeterStrumTableViewModel])]> { get }

    
    func viewDidLoad()
    
    func rowTaped(_ section: Int, row: Int)
    
    func addNewIndication()
    
    func updateIndication()
    
    func checkUpdate() -> IndicationStatus
    
    func deleteAllert(indication: StrumIndication)
    
    func deleteData()
    
}

//MARK: - MeterStrumViewModel

class MeterStrumViewModel {
    
    private weak var output: MeterStrumOutput?
    private weak var input: MeterStrumInput?
    
    private let useCase: StrumUseCase
    private let dateManager: StrumDateManger
    private let indicationRepository: IndicationRepository
    private let indicationService: PrepareIndicationService
    
    private var strumIndication: [StrumIndication] = []
    private var yearsArray: [String] = []
    
    lazy var indicationStatus: IndicationStatus = {
        .none
    }()
    
    var tableData: Binding<[(section: String, row: [MeterStrumTableViewModel])]> = Binding([])

    
    init(output: MeterStrumOutput, useCase: StrumUseCase, dateManager: StrumDateManger = StrumDateMangerImpl(), indicationRepository: IndicationRepository, indicationService: PrepareIndicationService = PrepareIndicationServiceImpl()) {
        self.output = output
        self.useCase = useCase
        self.dateManager = dateManager
        self.indicationRepository = indicationRepository
        self.indicationService = indicationService
    }
    
    
    
}

//MARK: - MeterStrumViewModelInterface

extension MeterStrumViewModel: MeterStrumViewModelInterface {
    
    func viewDidLoad() {
        tableDataConfig()
    }
    
    private func getCountMonthInYear(_ year: String) -> Int {
        return (year == dateManager.currentYear()) ? dateManager.countCurrentMonth() : 12
    }
    
    private func getMonth(countMonth: Int, monthIndex: Int) -> String {
        R.Months.allCases[countMonth-1-monthIndex].rawValue
    }
    
    private func tableDataConfig() {
        strumIndication = useCase.getStrumIndicationData()
        yearsArray = dateManager.obtainYears(in: strumIndication)
        
        var rows: [MeterStrumTableViewModel] = []
        var countMonth: Int!
        
        tableData.value = yearsArray.compactMap { year in
            rows = []
            let indicationInSection = strumIndication.filter { dateManager.yearFromDate($0.transferDate) == year }
            countMonth = getCountMonthInYear(year)
            for monthIndex in 0..<countMonth {
                print("montheIndex: \(monthIndex), ")
                let month = getMonth(countMonth: countMonth, monthIndex: monthIndex)
                if let indicationForMonth = indicationInSection.first(where: { dateManager.monthFromDate($0.transferDate) == String(countMonth-monthIndex) }) {
                    let myRow = MeterStrumTableViewModel(month: month,
                                                         dayMeter: indicationForMonth.dayMeter,
                                                         nightMeter: indicationForMonth.nightMeter,
                                                         diferencePrice: nil,
                                                         transferDate: indicationForMonth.transferDate
                    )
                    rows.append(myRow)
                } else {
                    rows.append(MeterStrumTableViewModel(month: month,
                                                         dayMeter: nil,
                                                         nightMeter: nil,
                                                         diferencePrice: nil,
                                                         transferDate: nil
                    ))
                }
            }
            return (section: year, row: rows)
        }
    }
    
    func rowTaped(_ section: Int, row: Int) {
        guard let year = Int(yearsArray[section]) else { return }
        let countMonth = getCountMonthInYear("\(year)")
        let month = getMonth(countMonth: countMonth, monthIndex: row)
        let currentTableData = tableData.value[section].row[row]
        var currentMonth = Date()
        if let monthIndex = R.Months.allCases.firstIndex(where: { $0.rawValue == month }) {
            currentMonth = dateManager.getDateFromComponents(year: year, month: monthIndex)
            
        }
        if let dayMeter = currentTableData.dayMeter, let nightMeter = currentTableData.nightMeter, let transferDate = currentTableData.transferDate {
            let choosenIndication = StrumIndication(dayMeter: dayMeter, nightMeter: nightMeter, transferDate: transferDate)
            indicationStatus = .change
            output?.showDetailIndication(indication: choosenIndication, currentMonth: currentMonth)
        } else {
            indicationStatus = .add
            output?.showDetailIndication(indication: nil, currentMonth: currentMonth)
        }
    }
    
    func addNewIndication() {
        output?.showNewIndication()
        indicationStatus = .add
    }
    
    func updateIndication() {
        let indication = indicationRepository.getAllIndications().first
        indicationRepository.clearRepository()
        
        strumIndication = indicationService.prepareIndication(strumIndication, indication: indication, indicationStatus: indicationStatus)
        
        useCase.addNewIndication(strumIndication)
        
        tableDataConfig()
    }
    
    func checkUpdate() -> IndicationStatus {
        if indicationRepository.getAllIndications().isEmpty {
            return .none
        } else if indicationRepository.getStatus() == .delete {
            return .delete
        } else {
            return .add
        }
    }
    
    func deleteAllert(indication: StrumIndication) {
        output?.showDeleteAllert(indication: indication)
    }
    
    func deleteData() {
        print("delete")
        indicationStatus = .delete
        updateIndication()
    }

}
