//
//  StrumViewModel.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 23.04.2023.
//

import Foundation

final class StrumViewModelImpl: StrumViewModelInputProtocol {
    
    var sections: [StrumSectionViewModelProtocol]
    
    init() {
        self.sections = []
        
        self.setupMainSection()
    }
    
    private func setupMainSection() {
        let section = StrumSectionViewModel(cells: [
            TextCellViewModel(text: "Hello"),
            TextCellViewModel(text: "It's UITableView with using MVVM")
        ])
        sections.append(section)
    }
}
