//
//  Array + extension.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 25.04.2023.
//

import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
