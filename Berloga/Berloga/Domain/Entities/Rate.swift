//
//  Rate.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 30.05.2023.
//

import Foundation

struct RateMeter: Codable, Equatable {
    var dayRate: Float
    var nightRate: Float
    var adoptionDate: Date
    
    static func == (lhs: RateMeter, rhs: RateMeter) -> Bool {
        return (lhs.dayRate == rhs.dayRate) && (lhs.nightRate == rhs.nightRate)
    }
}

