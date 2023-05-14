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
}

//MARK: - MeterStrumInput

protocol MeterStrumInput: AnyObject {
    
    func addIndication(_ indication: StrumIndication)
}
