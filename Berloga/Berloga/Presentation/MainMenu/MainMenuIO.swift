//
//  MainMenuIO.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 06.05.2023.
//

import Foundation

//MARK: - MainMenuOutput

protocol MainMenuOutput: AnyObject {
    func showStrum()
    func showSettings()
    func showGardening()
}

//MARK: - MainMenuInput

protocol MainMenuInput: AnyObject { }
