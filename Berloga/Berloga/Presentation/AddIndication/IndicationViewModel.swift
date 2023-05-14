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
}

//MARK: - IndicationViewModel

class IndicationViewModel {
    
    private weak var output: IndicationOutput?
    private let input: IndicationInput
    
    init(output: IndicationOutput, input: IndicationInput) {
        self.output = output
        self.input = input
    }
}

//MARK: - IndicationViewModelInterface

extension IndicationViewModel: IndicationViewModelInterface {
    func viewDidLoad() {
        
    }
    
    func saveIndication(_ indication: StrumIndication) {
        input.saveNewIndication(indication)
        output?.didAddIndication()
    }
}


