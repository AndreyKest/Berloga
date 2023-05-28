//
//  MeterStrumIO.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 05.05.2023.
//

import Foundation

//MARK: - MeterStrumOutput

protocol MeterStrumOutput: AnyObject {
    func showNewIndication()
    func showDeleteAllert(indication: StrumIndication)
    func showDetailIndication(indication: StrumIndication?, currentMonth: Date)
}

//MARK: - MeterStrumInput

protocol MeterStrumInput: AnyObject {
    
    func addIndication(_ indication: StrumIndication)
}
