//
//  StrumTableView.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 24.04.2023.
//

import UIKit

class StrumTableView: UITableView {
    
    var viewModel: StrumViewModelInputProtocol?
    var cellFactory: StrumCellFactoryProtocol? {
        didSet {
            cellFactory?.cellTypes.forEach({ $0.register(self)})
        }
    }
    
    var rowInSection: Int = 0
    var section: Int = 0
    
    func setup() {
        self.delegate = self
        self.dataSource = self
    }
    
//    override init(frame: CGRect, style: UITableView.Style) {
//        super.init(frame: frame, style: style)
//
//        register(StrumTableViewCell.self, forCellReuseIdentifier: R.CellReuseIdentifier.StrumCellReuseIdentifier)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}

extension StrumTableView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.sections.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.sections[section].cells.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cellFactory = cellFactory,
            let cellViewModel = viewModel?.sections[indexPath.section].cells[indexPath.row]
        else {
            return UITableViewCell()
        }
        
        return cellFactory.generateCell(viewModel: cellViewModel, tableView: tableView, for: indexPath)
    }
}
