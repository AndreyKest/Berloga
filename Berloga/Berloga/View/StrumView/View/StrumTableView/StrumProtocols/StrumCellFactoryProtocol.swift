//
//  StrumCellFactoryProtocol.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 27.04.2023.
//

import UIKit

protocol StrumCellFactoryProtocol {
    var cellTypes: [StrumCellProtocol.Type] { get }
    func generateCell(viewModel: StrumCellViewModelProtocol, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell
}
