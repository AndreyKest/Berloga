//
//  NavBarController.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 23.04.2023.
//

import UIKit

class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    
    func configureAppearance() {
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = R.Colors.navBarBackgorund
            
            let titleAttribute = [NSAttributedString.Key.foregroundColor: R.Colors.navBarTextColor]
            appearance.titleTextAttributes = titleAttribute
            
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            
            navigationBar.tintColor = R.Colors.navBarTextColor
        }
    }
    
}
