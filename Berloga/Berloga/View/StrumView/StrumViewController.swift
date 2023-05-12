//
//  StrumViewController.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 23.04.2023.
//

import UIKit

class StrumViewController: BaseController {


    var tableView = StrumTableView() {
        didSet {
            tableView.viewModel = StrumViewModelImpl()
            tableView.cellFactory = MainCellFactory()
            
            tableView.setup()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        
    }
    
}

//extension StrumViewController {
//
//    override func setupViews() {
//        super.setupViews()
//        view.addToView(tableView)
//    }
//    override func constraintViews() {
//        super.constraintViews()
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])
//    }
//
//    override func configureAppearance() {
//        super.configureAppearance()
//        title = "Strum"
//    }
//}
