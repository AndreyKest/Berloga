//
//  StrumUseCase.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 05.05.2023.
//

import Foundation

//MARK: - StrumUseCase

protocol StrumUseCase {
    func getStrumIndicationData() -> [StrumIndication]
    
    func getTestIndication() -> [StrumIndication]
}

//MARK: - StrumUseCaseImpl

class StrumUseCaseImpl {
    
    var strumIndication: [StrumIndication] = []
}

//MARK: - StrumUseCase

extension StrumUseCaseImpl: StrumUseCase {
    
    func getStrumIndicationData() -> [StrumIndication] {
        return []
    }
    
    
    func getTestIndication() -> [StrumIndication] {
        return [
        StrumIndication(dayMeter: 10000, nightMeter: 5000, transferDate: "01/03/2023"),
        StrumIndication(dayMeter: 8000, nightMeter: 4000, transferDate: "01/01/2023"),
        StrumIndication(dayMeter: 5000, nightMeter: 2000, transferDate: "01/12/2022"),
        StrumIndication(dayMeter: 1000, nightMeter: 500, transferDate: "01/07/2022"),
        ]
    }
    
}
