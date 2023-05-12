//
//  MainMenuTableViewCell.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 06.05.2023.
//

import UIKit

//MARK: - Constants

private enum Constants {
    static var leftRightSpacing: CGFloat { 16 }
    static var topBottomSpacing: CGFloat { 16 }
}

//MARK: - StudentEvalutionsTableViewModel

struct MainMenuTableCellModel {
    let title: String
}

//MARK: - MainMenuTableViewCell

class MainMenuTableViewCell: UITableViewCell {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var model: MainMenuTableCellModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        constraintsView()
        configureAppearance()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cellSpacing()
    }
    
    private func setupViews() {
        contentView.addToView(titleLabel)
    }
    
    private func constraintsView() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.topBottomSpacing),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.leftRightSpacing),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.leftRightSpacing),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.topBottomSpacing),
        ])
    }
    
    private func configureAppearance() {
        backgroundColor = UIColor(hexString: "#363B47")
        let backgroundColorView = UIView()
        backgroundColorView.backgroundColor = UIColor(hexString: "#3A393B")
        
        MainMenuTableViewCell.appearance().selectedBackgroundView = backgroundColorView
    }
    
    private func cellSpacing() {
        let verticalPadding: CGFloat = 8
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10    //if you want round edges
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        layer.mask = maskLayer
    }
    
    func setup(with model: MainMenuTableCellModel) {
        self.model = model
        
        titleLabel.text = model.title
        
    }
}
