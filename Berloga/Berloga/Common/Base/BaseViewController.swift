//
//  BaseViewController.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 23.04.2023.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        constraintsViews()
        configureAppearance()
    }
}

@objc extension BaseController {
    
    func setupViews() {}
    
    func constraintsViews() {}
    
    func configureAppearance() {
        view.backgroundColor = R.Colors.background
    }
    
    func navBarLeftButtonHandler() {
        print("Left")
    }
    
    func navBarRightButtonHandler() {
        print("Right")
    }
}

extension BaseController {
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.titleLabel?.font = R.Fonts.helveticaRegular(with: 17)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
        
    }
}

