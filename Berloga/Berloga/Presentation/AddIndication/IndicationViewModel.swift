//
//  IndicationViewModel.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 11.05.2023.
//

import Foundation

//MARK: - IndicationViewModelInterface

protocol IndicationViewModelInterface {
    func viewDidLoad()
    func saveIndication(_ indication: StrumIndication)
    func defaultRateAlert(date: Date)
    
    var mainData: StrumIndication? { get set }
    var currentMonth: Date { get }
    var rate: RateMeter { get set }
    
    var bindRate: Binding<RateMeter> { get set }
}

//MARK: - IndicationViewModel

class IndicationViewModel {
    
    private weak var output: IndicationOutput?
    private let indicationRepository: IndicationRepository
    private var indication: StrumIndication?
    var mainData: StrumIndication?
    var currentMonth: Date
    var rate: RateMeter
    
    var bindRate: Binding<RateMeter> = Binding(RateMeter(dayRate: 0, nightRate: 0, adoptionDate: Date()))
    
    
    init(output: IndicationOutput, indicationRepository: IndicationRepository, indication: StrumIndication? = nil, currentMonth: Date, rate: RateMeter) {
        self.output = output
        self.indicationRepository = indicationRepository
        self.indication = indication
        self.currentMonth = currentMonth
        self.rate = rate
    }
}

//MARK: - IndicationViewModelInterface

extension IndicationViewModel: IndicationViewModelInterface {
    func viewDidLoad() {
        mainData = indication
        bindRate.value = rate
    }
    
    func saveIndication(_ indication: StrumIndication) {
        indicationRepository.addIndication(indication)
        output?.saveNewIndicationAndBack()
    }
    
    func defaultRateAlert(date: Date) {
        output?.showDefaultRateAllert(date: date)
    }
}


