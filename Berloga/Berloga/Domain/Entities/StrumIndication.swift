//
//  StrumIndication.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 24.04.2023.
//

import Foundation

protocol StringData: Equatable {
    var transferDate: String { get }
}

struct StrumIndication: Codable, Equatable, StringData {
    var dayMeter: Int
    var nightMeter: Int
    var transferDate: String
    
    static func == (lhs: StrumIndication, rhs: StrumIndication) -> Bool {
        return lhs.transferDate == rhs.transferDate
    }
}
