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
        }
    }
    
    private func deleteAlert() -> UIViewController {
        let alert = UIAlertController(title: "Hello", message: "Allert was shown", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cancelAction)
        
        return alert
    }
}
