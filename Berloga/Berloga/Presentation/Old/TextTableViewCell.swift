//
//  TextTableViewCell.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 27.04.2023.
//

import UIKit

protocol TextCellViewModelInputProtocol {
    var text: String { get }
}

typealias TextCellViewModelType = StrumCellViewModelProtocol & TextCellViewModelInputProtocol

class TextCellViewModel: TextCellViewModelType {
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
}

final class TextTableViewCell: UITableViewCell, StrumCellProtocol {
    
    // MARK: - var/let
    
    var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Public properties
    
    var viewModel: TextCellViewModelInputProtocol? {
        didSet {
            bindViewModel()
        }
    }
    
    // MARK: - Private methods
    
    private func bindViewModel() {
        label.text = viewModel?.text
    }
    
}
