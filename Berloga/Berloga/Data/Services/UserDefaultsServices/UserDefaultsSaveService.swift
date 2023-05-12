//
//  UserDefaultsSaveService.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 24.04.2023.
//

import UIKit

protocol UserDefaultsSaveService {
    func saveData<T: Encodable>(_ data: T, forKey key: String)
}

class UserDefaultsSaveServiceImpl: UserDefaultsSaveService {
    
    let userDefaults: UserDefaults!
    let encoder: JSONEncoder!
    
    func saveData<T: Encodable>(_ data: T, forKey key: String) {
        guard let jsonData = try? encoder.encode(data) else { return }
        userDefaults.set(jsonData, forKey: key)
    }
    
    init(userDefaults: UserDefaults = .standard, encoder: JSONEncoder = JSONEncoder()) {
        self.userDefaults = userDefaults
        self.encoder = encoder
    }
}
