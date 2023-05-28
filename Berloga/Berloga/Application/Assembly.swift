//
//  Assembly.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 05.05.2023.
//

import UIKit

class Assembly {
    
    private let indicationRepository: IndicationRepository
    
    lazy var categoryAssembly: CategoryUseCase = {
        CategoryUseCaseImpl()
    }()
    
    lazy var meterAssembly: StrumUseCase = {
        StrumUseCaseImpl()
    }()
    
    init(indicationRepository: IndicationRepository) {
        self.indicationRepository = indicationRepository
    }
    
    func makeMainMenu(output: MainMenuOutput) -> BaseController {
        let viewModel = MainMenuViewModel(output: output, useCase: categoryAssembly)
        let view = MainMenuViewController(viewModel: viewModel)
        return view
    }
    
    func makeMeterStrum(viewModel: MeterStrumViewModelInterface) -> BaseController {
        let view = MeterStrumViewController(viewModel: viewModel)
        return view
    }
    
    func makeIndication(output: IndicationOutput) -> BaseController {
        let viewModel = IndicationViewModel(output: output, indicationRepository: indicationRepository, currentMonth: Date())
        let view = IndicationViewController(viewModel: viewModel)
        return view
    }
    
    func makeDetailIndication(output: IndicationOutput, indication: StrumIndication?, currentMonth: Date) -> BaseController {
        let viewModel = IndicationViewModel(output: output, indicationRepository: indicationRepository, indication: indication, currentMonth: currentMonth)
        let view = IndicationViewController(viewModel: viewModel)
        return view
    }
}
