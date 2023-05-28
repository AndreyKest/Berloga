//
//  MeterStrumViewController.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 05.05.2023.
//

import Foundation
import UIKit

private enum Constants {
    static var meterStrumTableViewCellIdentifier: String { "MeterStrumTableViewCellIdentifier" }
    
    static var title: String { "Показания" }
    
    static var backgroundColor: UIColor { .white}
}

//MARK: - MeterStrumViewControllerInterface

protocol MeterStrumViewControllerInterface: AnyObject {
}

//MARK: - MeterStrumViewController

class MeterStrumViewController: BaseController {
    
    private let viewModel: MeterStrumViewModelInterface
    
    private func setupBinding() {
            viewModel.tableData.bind { [weak self] _ in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    
    let tableView = UITableView()
    
    init(viewModel: MeterStrumViewModelInterface) {
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
        setupBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        switch viewModel.checkUpdate() {
            
        case .add:
            viewModel.updateIndication()
        case .change:
            break
        case .delete:
            print("Was delete")
        case .none:
            break
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MeterStrumTableViewCell.self, forCellReuseIdentifier: Constants.meterStrumTableViewCellIdentifier)
        tableView.backgroundColor = R.Colors.background
    }
    
}

//MARK: - MeterStrumViewController setupUI

extension MeterStrumViewController {
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
        addNavBarButton(at: .right, with: "Добавить")
    }
    
    override func navBarRightButtonHandler() {
        viewModel.addNewIndication()
    }
}

//MARK: - MeterStrumViewController UITableViewDelegate, UITableViewDataSource

extension MeterStrumViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.tableData.value.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tableData.value[section].row.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.tableData.value[section].section
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.meterStrumTableViewCellIdentifier, for: indexPath) as? MeterStrumTableViewCell else { return UITableViewCell() }
        cell.setup(with: viewModel.tableData.value[indexPath.section].row[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.rowTaped(indexPath.section, row: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.textLabel?.textColor = UIColor.lightGray
    }

    
}

//MARK: - Swipe delete data extension

extension MeterStrumViewController {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let indication = viewModel.tableData.value[indexPath.section].row[indexPath.row]
        if indication.dayMeter != nil && indication.nightMeter != nil {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
                let strumIndication = StrumIndication(dayMeter: indication.dayMeter ?? 0, nightMeter: indication.nightMeter ?? 0, transferDate: indication.transferDate ?? Date())
                self.viewModel.deleteAllert(indication: strumIndication)
                handler(true)
            }
            deleteAction.backgroundColor = .red
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            configuration.performsFirstActionWithFullSwipe = false
            return configuration
        } else {
            return nil
        }
    }
}

//MARK: - MeterStrumViewControllerInterface

extension MeterStrumViewController: MeterStrumViewControllerInterface {
}
