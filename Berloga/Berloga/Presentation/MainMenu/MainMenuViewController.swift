//
//  MainMenuViewController.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 06.05.2023.
//

import Foundation
import UIKit

private enum Constants {
    
    static var title: String { "Главное меню" }
    
    static var mainMenuTableViewCellIdentifier: String { "MainMenuTableViewCellIdentifier" }
    
}

//MARK: - MainMenuViewControllerInterface

protocol MainMenuViewControllerInterface: AnyObject {
    
}

//MARK: - MainMenuViewController

class MainMenuViewController: BaseController {
    
    private let viewModel: MainMenuViewModelInterface
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
        return tableView
    }()
    
    init(viewModel: MainMenuViewModelInterface) {
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
        setupTableView()
        
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainMenuTableViewCell.self, forCellReuseIdentifier: Constants.mainMenuTableViewCellIdentifier)
        tableView.backgroundColor = R.Colors.background
    }
}

//MARK: - MainMenuViewController setupUI

extension MainMenuViewController {
    override func setupViews() {
        
        view.addToView(tableView)
    }
    
    override func constraintsViews() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        title = Constants.title
        navigationItem.backButtonTitle = "Назад"
        
    }
}

//MARK: - MainMenuViewController impl UITableViewDelegate, UITableViewDataSource

extension MainMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.mainMenuTableViewCellIdentifier, for: indexPath) as? MainMenuTableViewCell else { return UITableViewCell()
        }
        cell.setup(with: viewModel.tableData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.rowTaped(indexPath.row)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


//MARK: - AdminViewControllerInterface

extension MainMenuViewController: MainMenuViewControllerInterface {
    
}
