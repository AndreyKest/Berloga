//
//  UserDefaultsFetchService.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 24.04.2023.
//

import UIKit

protocol UserDefaultsFetchService {
    func fetchData<T: Decodable>(_ type: T.Type, forKey key: String) -> T?
}

class UserDefaultsFetchServiceImpl: UserDefaultsFetchService {
    
    let userDefaults: UserDefaults!
    let decoder: JSONDecoder!
    
    func fetchData<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        guard let data = userDefaults.data(forKey: key),
              let object = try? decoder.decode(type, from: data)
        else {
            return nil
        }
        return object
    }
    
    init(userDefaults: UserDefaults = .standard, decoder: JSONDecoder = JSONDecoder()) {
        self.userDefaults = userDefaults
        self.decoder = decoder
    }
}
