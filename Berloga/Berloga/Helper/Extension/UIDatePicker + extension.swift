//
//  UIDatePicker + extension.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 12.05.2023.
//

import UIKit

extension UIDatePicker {

var textColor: UIColor? {
    set {
        setValue(newValue, forKeyPath: "textColor")
    }
    get {
        return value(forKeyPath: "textColor") as? UIColor
    }
  }
}
