//
//  TabBarControllerBuilder.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 23.04.2023.
//

import UIKit

protocol TabBarControllerBuilder: AnyObject {
    
    func createControllers() -> [NavBarController]
    
}

class TabBarControllerBuilderImpl: TabBarControllerBuilder {
    
    func createControllers() -> [NavBarController] {
            let controllers: [NavBarController] = Tabs.allCases.map { tab in
                let controller = NavBarController(rootViewController: createController(for: tab))
                controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.title(for: tab),
                                                     image: R.Images.TabBar.icon(for: tab),
                                                     tag: tab.rawValue)
                return controller
            }
            return controllers
        }
        
        private  func createController(for tab: Tabs) -> BaseController {
            switch tab {
            case .mainview: return StrumViewController()
            case .settings: return SettingsViewController()
            }
        }
}
