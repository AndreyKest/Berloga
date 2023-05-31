//
//  Coordinator.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 05.05.2023.
//

import UIKit

//MARK: - Coordinator


class Coordinator {
    
    private let assembly: Assembly
    
    private var navigationViewController: NavBarController?
    
    private let repository: IndicationRepository
    
    lazy var meterAssembly: StrumUseCase = {
        StrumUseCaseImpl()
    }()
    
    lazy var meterStrumViewModel: MeterStrumViewModelInterface = {
        MeterStrumViewModel(output: self, useCase: meterAssembly, indicationRepository: repository)
    }()
    
    private lazy var defaultAllertFactory: DefaultAllertFactory = DefaultAllertFactoryImpl()
    
    init(assembly: Assembly, repository: IndicationRepository = IndicationRepositoryImpl.shared) {
        self.assembly = assembly
        self.repository = repository
    }
    
    func start(window: UIWindow) {
        let mainMenuView = assembly.makeMainMenu(output: self)
        navigationViewController = NavBarController(rootViewController: mainMenuView)
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
    }
}

//MARK: - MainMenuOutput
extension Coordinator: MainMenuOutput {
    func showStrum() {
        let strum = assembly.makeMeterStrum(viewModel: meterStrumViewModel)
        navigationViewController?.pushViewController(strum, animated: true)
    }
    func showSettings() {
        return
    }
    func showGardening() {
        return
    }
    
    
}

extension Coordinator: MeterStrumOutput {
    
    func showNewIndication(rate: RateMeter) {
        let newIndication = assembly.makeIndication(output: self, rate: rate)
        navigationViewController?.pushViewController(newIndication, animated: true)
    }
    
    
    func showDeleteAllert(indication: StrumIndication) {
        let allert = defaultAllertFactory.getAllert(by: .deleteAllert)
        navigationViewController?.present(allert, animated: true)
        
        if let alertController = allert as? UIAlertController {
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
                self?.repository.deleteAction()
                self?.repository.addIndication(indication)
                self?.meterStrumViewModel.deleteData()
            }
            alertController.addAction(deleteAction)
        }
    }
    
    func showDetailIndication(indication: StrumIndication?, currentMonth: Date, rate: RateMeter) {
        let detailIndication = assembly.makeDetailIndication(output: self, indication: indication, currentMonth: currentMonth, rate: rate)
        navigationViewController?.pushViewController(detailIndication, animated: true)
    }
}


extension Coordinator: IndicationOutput {
    
    func saveNewIndicationAndBack() {
        navigationViewController?.popViewController(animated: true)
        meterStrumViewModel.updateIndication()
    }
}
