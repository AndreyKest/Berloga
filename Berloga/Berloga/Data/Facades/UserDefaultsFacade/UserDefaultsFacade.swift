//
//  UserDefaultsFacade.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 24.04.2023.
//

import Foundation

protocol UserDefaultsFacade {
    func saveData<T: Encodable>(_ data: T, forKey key: String)
    func fetchData<T: Decodable>(_ type: T.Type, forKey key: String) -> T?
}

class UserDefaultsFacadeImpl: UserDefaultsFacade {
    private let saveService: UserDefaultsSaveService
    private let fetchService: UserDefaultsFetchService
    
    init(saveService: UserDefaultsSaveService = UserDefaultsSaveServiceImpl(),
         fetchService: UserDefaultsFetchService = UserDefaultsFetchServiceImpl()) {
        self.saveService = saveService
        self.fetchService = fetchService
    }
    
    func saveData<T: Encodable>(_ data: T, forKey key: String) {
        saveService.saveData(data, forKey: key)
    }
    
    func fetchData<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        return fetchService.fetchData(type, forKey: key)
    }
}

