//
//  CategoryUseCase.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 06.05.2023.
//

//MARK: - CategoryUseCase

protocol CategoryUseCase {
    func getAllCategories() -> [Category]
    func getEnableCategories() -> [Category]
}

//MARK: - CategoryUseCaseImpl

class CategoryUseCaseImpl {
    
}

//MARK: - CategoryUseCase

extension CategoryUseCaseImpl: CategoryUseCase {
    
    func getAllCategories() -> [Category] {
        return [
            Category(name: "Strum", status: .enable, controller: .strum),
            Category(name: "Settings", status: .enable, controller: .settings),
        ]
    }
    
    func getEnableCategories() -> [Category] {
        return []
    }
}
