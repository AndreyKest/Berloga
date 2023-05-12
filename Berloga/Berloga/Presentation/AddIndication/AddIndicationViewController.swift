//
//  AddIndicationViewController.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 11.05.2023.
//

import Foundation
import UIKit

private enum Constants {
  
    static var title: String { "Добавить показания" }
    
}

//MARK: - AddIndicationViewControllerInterface

protocol AddIndicationViewControllerInterface: AnyObject {
    
}

//MARK: - AddIndicationViewController

class AddIndicationViewController: BaseController {
    
    private let viewModel: AddIndicationViewModelInterface
    
    
    init(viewModel: AddIndicationViewModelInterface) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
    }
    
    
}

//MARK: - MeterStrumViewController setupUI

extension AddIndicationViewController {
    override func setupViews() {
        
    }
    
    override func constraintsViews() {
        
        NSLayoutConstraint.activate([
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        title = Constants.title
        addNavBarButton(at: .right, with: "Сохранить")
    }
}
