//
//  CategoryViewBuilder.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 07.05.2023.
//

import UIKit


//import UIKit
//
//protocol TabBarControllerBuilder: AnyObject {
//
//    func createControllers() -> [NavBarController]
//
//}
//
//class TabBarControllerBuilderImpl: TabBarControllerBuilder {
//
//    func createControllers() -> [NavBarController] {
//            let controllers: [NavBarController] = Tabs.allCases.map { tab in
//                let controller = NavBarController(rootViewController: createController(for: tab))
//                controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.title(for: tab),
//                                                     image: R.Images.TabBar.icon(for: tab),
//                                                     tag: tab.rawValue)
//                return controller
//            }
//            return controllers
//        }
//
//        private  func createController(for tab: Tabs) -> BaseController {
//            switch tab {
//            case .strum: return StrumViewController()
//            case .settings: return SettingsViewController()
//            }
//        }
//}



protocol CategoryViewBuilder {
    func categoryView(from category: Category) -> BaseController
}

class CategoryViewBuilderImpl: CategoryViewBuilder {
    private let assembly: Assembly
    
    init(assembly: Assembly) {
        self.assembly = assembly
    }
    
    func categoryView(from category: Category) -> BaseController {
        switch category.controller {
        case .strum:
            return assembly.makeMeterStrum(output: <#T##MeterStrumOutput#>)
        case .settings:
            <#code#>
        case .gardening:
            <#code#>
        }
    }
    
    
    
}
