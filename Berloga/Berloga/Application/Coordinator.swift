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
    
    init(assembly: Assembly) {
        self.assembly = assembly
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
        let strum = assembly.makeMeterStrum(output: self)
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
    func showNewIndication() {
        let newIndication = assembly.makeAddIndication(output: self)
        navigationViewController?.pushViewController(newIndication, animated: true)
    }
}

extension Coordinator: AddIndicationOutput {
    
}


