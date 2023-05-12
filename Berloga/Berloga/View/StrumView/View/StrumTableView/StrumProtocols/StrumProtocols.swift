//
//  StrumProtocols.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 27.04.2023.
//

protocol StrumCellViewModelProtocol { }

protocol StrumSectionViewModelProtocol {
    var cells: [StrumCellViewModelProtocol] { get }
}

protocol StrumViewModelInputProtocol {
    var sections: [StrumSectionViewModelProtocol] { get }
}
