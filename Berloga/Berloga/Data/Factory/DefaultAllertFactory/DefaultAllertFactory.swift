//
//  DefaultAllertFactory.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 21.05.2023.
//

import Foundation
import UIKit

enum DefaultAlertType {
    case okAlert
    case deleteAllert
    case defaultRateAlert
}

protocol DefaultAllertFactory: AnyObject {
    
    func getAllert(by type: DefaultAlertType) -> UIViewController
    
}

final class DefaultAllertFactoryImpl: DefaultAllertFactory {
    
    func getAllert(by type: DefaultAlertType) -> UIViewController {
        switch type {
        case .okAlert:
            return deleteAlert()
        case .deleteAllert:
            return deleteAlert()
        case .defaultRateAlert:
        return defaultRateAlert()
        }
    }
    
    private func deleteAlert() -> UIViewController {
        let alert = UIAlertController(title: "Hello", message: "Allert was shown", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cancelAction)
        
        return alert
    }
    
    private func defaultRateAlert() -> UIViewController {
        let alert = UIAlertController(title: "Изменить стандартный тариф показаний", message: "Введите новый тариф показаний", preferredStyle: .alert)
        
        alert.addTextField() { textFields in
            textFields.placeholder = "Дневной тариф"
            textFields.returnKeyType = .next
            textFields.keyboardType = .decimalPad
        }
        
        alert.addTextField() { textFields in
            textFields.placeholder = "Ночной тариф"
            textFields.returnKeyType = .continue
            textFields.keyboardType = .decimalPad
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cancelAction)
        
        return alert
    }
}
