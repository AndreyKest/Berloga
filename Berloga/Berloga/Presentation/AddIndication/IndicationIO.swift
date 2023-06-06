//
//  IndicationIO.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 11.05.2023.
//

import Foundation

//MARK: - IndicationOutput

protocol IndicationOutput: AnyObject {
    func saveNewIndicationAndBack()
    func showDefaultRateAllert(date: Date)
}

//MARK: - IndicationInput

protocol IndicationInput: AnyObject {
}
