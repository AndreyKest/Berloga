//
//  MeterStrumTableViewCell.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 05.05.2023.
//

import UIKit

private enum Constants {
    static var leftRightSpacing: CGFloat { 16 }
    static var topBottomSpacing: CGFloat { 16 }
    
    static var titleFont: UIFont { .boldSystemFont(ofSize: 16) }
    static var subTitleFont: UIFont { .systemFont(ofSize: 14) }
        
}

//MARK: - MeterStrumTableViewModel

struct MeterStrumTableViewModel {
    let month: String
    let dayMeter: Int?
    let nightMeter: Int?
    let diferencePrice: Float?
}

//MARK: - StudenTableViewCell

class MeterStrumTableViewCell: UITableViewCell {
    
    
    private let monthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    private let dayMeterLabel: UILabel = {
        let label = UILabel()
        label.text = "День:"
        label.textColor = .gray
        return label
    }()
    
    private let nightMeterLabel: UILabel = {
        let label = UILabel()
        label.text = "Ночь:"
        label.textColor = .gray
        return label
    }()
    
    private let dayMeterDataLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let nightMeterDataLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let monthDifferenceCount: UILabel = {
        let label = UILabel()
        label.textColor = .green
        return label
    }()
    
    var model: MeterStrumTableViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        constraintsView()
        configureAppearance()
        cellSpacing()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dayMeterDataLabel.text = ""
        nightMeterDataLabel.text = ""
        monthLabel.textColor = .gray
        monthDifferenceCount.text = ""
    }
    
    private func setupViews() {
        contentView.addToView(monthLabel)
        contentView.addToView(dayMeterLabel)
        contentView.addToView(nightMeterLabel)
        contentView.addToView(dayMeterDataLabel)
        contentView.addToView(nightMeterDataLabel)
        contentView.addToView(monthDifferenceCount)
    
    }
    
    private func constraintsView() {
        NSLayoutConstraint.activate([
            dayMeterLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            dayMeterLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -20),
            
            dayMeterDataLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            dayMeterDataLabel.leadingAnchor.constraint(equalTo: dayMeterLabel.trailingAnchor, constant: 10),
            
            nightMeterLabel.topAnchor.constraint(equalTo: dayMeterLabel.bottomAnchor, constant: 10),
            nightMeterLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -20),
            nightMeterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            nightMeterDataLabel.topAnchor.constraint(equalTo: dayMeterDataLabel.bottomAnchor, constant: 10),
            nightMeterDataLabel.leadingAnchor.constraint(equalTo: nightMeterLabel.trailingAnchor, constant: 10),
            nightMeterDataLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            monthLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            monthLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            monthDifferenceCount.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            monthDifferenceCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
        ])
    }
    
    private func cellSpacing() {
        layer.cornerRadius = 8
    }
    
    private func configureAppearance() {
        backgroundColor = R.Colors.cellColor
        let backgroundColorView = UIView()
        backgroundColorView.backgroundColor = UIColor(hexString: "#3A393B")
        
        MainMenuTableViewCell.appearance().selectedBackgroundView = backgroundColorView
    }
    
    func setup(with model: MeterStrumTableViewModel) {
        self.model = model
        monthLabel.text = model.month
        if let dayMeter = model.dayMeter, let nightMeter = model.nightMeter {
            dayMeterDataLabel.text = String(dayMeter)
            nightMeterDataLabel.text = String(nightMeter)
            monthLabel.textColor = .white
        } else {
            dayMeterDataLabel.text = ""
            nightMeterDataLabel.text = ""
        }
    }
}
