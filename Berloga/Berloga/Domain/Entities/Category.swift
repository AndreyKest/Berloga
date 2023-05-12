//
//  Category.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 06.05.2023.
//

import Foundation

enum Status {
    case enable
    case disable
}

enum ControllerEnum {
    case strum
    case settings
    case gardening
}

struct Category {
    
    let name: String
    let status: Status
    let controller: ControllerEnum
    
}
