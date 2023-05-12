//
//  TabBarController.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 23.04.2023.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case strum
    case settings
}

class TabBarController: UITabBarController {
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAppearance() {
        tabBar.tintColor = R.Colors.active
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = R.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
    }
    
}

