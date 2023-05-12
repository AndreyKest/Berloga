//
//  StrumSectionViewModel.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 27.04.2023.
//

import Foundation

class StrumSectionViewModel: StrumSectionViewModelProtocol {
    var cells: [StrumCellViewModelProtocol]
    
    init(cells: [StrumCellViewModelProtocol]) {
        self.cells = cells
    }
}
