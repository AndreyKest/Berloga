//
//  Assembly.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 05.05.2023.
//

import UIKit

class Assembly {
    
    lazy var categoryAssembly: CategoryUseCase = {
        CategoryUseCaseImpl()
    }()
    
    lazy var meterAssembly: StrumUseCase = {
        StrumUseCaseImpl()
    }()
    
    lazy var dateManager: StrumDateManger = {
        StrumDateMangerImpl()
    }()
    
    func makeMainMenu(output: MainMenuOutput) -> BaseController {
        let viewModel = MainMenuViewModel(output: output, useCase: categoryAssembly)
        let view = MainMenuViewController(viewModel: viewModel)
        return view
    }
    
    func makeMeterStrum(output: MeterStrumOutput) -> BaseController {
        let viewModel = MeterStrumViewModel(output: output, useCase: meterAssembly, dateManager: dateManager)
        let view = MeterStrumViewController(viewModel: viewModel)
        return view
    }
    
    func makeAddIndication(output: AddIndicationOutput) -> BaseController {
        let viewModel = AddIndicationViewModel(output: output)
        let view = AddIndicationViewController(viewModel: viewModel)
        return view
    }
}
