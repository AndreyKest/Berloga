//
//  MeterStrumViewModel.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 05.05.2023.
//

import Foundation

//MARK: - MeterStrumViewModelInterface

protocol MeterStrumViewModelInterface {
    
    var tableData: [(section: String, row: [MeterStrumTableViewModel])] { get }
    
    func viewDidLoad()
    
    func rowTaped(_ section: Int, row: Int)
    
    func addNewIndication()
}

//MARK: - MeterStrumViewModel

class MeterStrumViewModel {
    
    private weak var output: MeterStrumOutput?
    
    private let useCase: StrumUseCase
    private let dateManager: StrumDateManger
    
    
    private var strumIndication: [StrumIndication] = []
    private var yearsArray: [String] = []
    
    var tableData = [(section: String, row: [MeterStrumTableViewModel])]()
    
    init(output: MeterStrumOutput, useCase: StrumUseCase, dateManager: StrumDateManger) {
        self.output = output
        self.useCase = useCase
        self.dateManager = dateManager
    }
    
    
}

//MARK: - MeterStrumViewModelInterface

extension MeterStrumViewModel: MeterStrumViewModelInterface {
    
    func viewDidLoad() {
        strumIndication = useCase.getTestIndication()
        yearsArray = dateManager.obtainYears(in: strumIndication)
        
        var rows: [MeterStrumTableViewModel] = []
        var countMonth: Int!
        
        tableData = yearsArray.compactMap { year in
            rows = []
            let indicationInSection = strumIndication.filter { dateManager.yearFromDate($0.transferDate) == year }
            countMonth = (year == dateManager.currentYear()) ? dateManager.countCurrentMonth() : 12
            for monthIndex in 0..<countMonth {
                print("montheIndex: \(monthIndex), ")
                let month = R.Months.allCases[countMonth-1-monthIndex]
                if let indicationForMonth = indicationInSection.first(where: { dateManager.monthFromDate($0.transferDate) == String(countMonth-monthIndex) }) {
                    let myRow = MeterStrumTableViewModel(month: month.rawValue,
                                                         dayMeter: indicationForMonth.dayMeter,
                                                         nightMeter: indicationForMonth.nightMeter,
                                                         diferencePrice: nil)
                    rows.append(myRow)
                } else {
                    rows.append(MeterStrumTableViewModel(month: month.rawValue,
                                                         dayMeter: nil,
                                                         nightMeter: nil,
                                                         diferencePrice: nil))
                }
            }
            return (section: year, row: rows)
        }
    }
    
    func rowTaped(_ section: Int, row: Int) {
        
    }
    func addNewIndication() {
        output?.showNewIndication()
    }
}


