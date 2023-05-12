//
//  MainMenuViewModel.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 06.05.2023.
//

import Foundation

//MARK: - MainMenuViewModelInterface

protocol MainMenuViewModelInterface {
    var tableData: [MainMenuTableCellModel] { get }
    
    func rowTaped(_ row: Int)
    
    func viewDidLoad()
}

//MARK: - MainMenuViewModel

class MainMenuViewModel {
    
    private weak var output: MainMenuOutput?
    
    private let useCase: CategoryUseCase
    private var categories: [Category] = []
    
    var tableData = [MainMenuTableCellModel]()
    
    init(output: MainMenuOutput, useCase: CategoryUseCase) {
        self.output = output
        self.useCase = useCase
    }
}

//MARK: - AdminViewModelInterface

extension MainMenuViewModel: MainMenuViewModelInterface {
    
    func rowTaped(_ row: Int) {
        switch categories[row].controller {
        case .strum:
            output?.showStrum()
        case .settings:
            output?.showSettings()
        case .gardening:
            output?.showGardening()
        }
    }
    
    func viewDidLoad() {
        categories = useCase.getAllCategories()
        tableData = categories.compactMap { category in
            if category.status == .enable {
                return MainMenuTableCellModel(title: category.name)
            } else {
                return nil
            }
        }
    }
}

