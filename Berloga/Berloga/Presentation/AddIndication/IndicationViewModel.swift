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
}

//MARK: - IndicationViewModel

class IndicationViewModel {
    
    private weak var output: IndicationOutput?
    private let indicationRepository: IndicationRepository
    private var indication: StrumIndication?
    var mainData: StrumIndication?
    var currentMonth: Date
    
    
    init(output: IndicationOutput, indicationRepository: IndicationRepository, indication: StrumIndication? = nil, currentMonth: Date) {
        self.output = output
        self.indicationRepository = indicationRepository
        self.indication = indication
        self.currentMonth = currentMonth
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


