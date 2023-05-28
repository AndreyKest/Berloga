//
//  SceneDelegate.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 23.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private let assembly = Assembly(indicationRepository: IndicationRepositoryImpl.shared)
    private lazy var coordinator = Coordinator(assembly: assembly)

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        coordinator.start(window: window)
        self.window = window
        
    }
    
}

