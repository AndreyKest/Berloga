//
//  UIView + extension.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 24.04.2023.
//

import UIKit

extension UIView {
    
    func addToView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
}
