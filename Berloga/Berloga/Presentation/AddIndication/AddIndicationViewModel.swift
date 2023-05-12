//
//  AddIndicationViewModel.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 11.05.2023.
//

import Foundation

//MARK: - AddIndicationViewModelInterface

protocol AddIndicationViewModelInterface {
    func viewDidLoad()
}

//MARK: - AddIndicationViewModel

class AddIndicationViewModel {
    
    private weak var output: AddIndicationOutput?
    
    init(output: AddIndicationOutput) {
        self.output = output
    }
}

//MARK: - AddIndicationViewModelInterface

extension AddIndicationViewModel: AddIndicationViewModelInterface {
    func viewDidLoad() {
        
    }
}


