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
    var mainData: StrumIndication? { get set }
    var currentMonth: Date { get }
    var rate: RateMeter { get set }
}

//MARK: - IndicationViewModel

class IndicationViewModel {
    
    private weak var output: IndicationOutput?
    private let indicationRepository: IndicationRepository
    private var indication: StrumIndication?
    var mainData: StrumIndication?
    var currentMonth: Date
    var rate: RateMeter
    
    
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
    }
    
    func saveIndication(_ indication: StrumIndication) {
        indicationRepository.addIndication(indication)
        output?.saveNewIndicationAndBack()
    }
}


