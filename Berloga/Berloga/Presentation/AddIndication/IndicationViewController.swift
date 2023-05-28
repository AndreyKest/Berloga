//
//  IndicationViewController.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 11.05.2023.
//

import Foundation
import UIKit

private enum Constants {
  
    static var title: String { "Добавить показания" }
    
}

//MARK: - IndicationViewControllerInterface

protocol IndicationViewControllerInterface: AnyObject {
    
}


//MARK: - IndicationViewController

class IndicationViewController: BaseController {
    
    private let viewModel: IndicationViewModelInterface
    var mainIndication: StrumIndication!
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let dayMeterLabel: UILabel = {
        let label = UILabel()
        label.text = "День:"
        label.textColor = .white
        return label
    }()
    
    private let nightMeterLabel: UILabel = {
        let label = UILabel()
        label.text = "Ночь:"
        label.textColor = .white
        return label
    }()
    
    let dayMeterTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = R.Colors.cellColor
        return textField
    }()
    
    let nightMeterTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = R.Colors.cellColor
        return textField
    }()
    
    let dateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата считывания:"
        label.textColor = .white
        return label
    }()
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.contentHorizontalAlignment = .left
        datePicker.maximumDate = .now
        
        datePicker.setValue(R.Colors.cellColor, forKey: "backgroundColor")
        datePicker.tintColor = .white
        datePicker.subviews[0].subviews[0].subviews[0].alpha = 0
        datePicker.textColor = .white
        return datePicker
    }()
    
    init(viewModel: IndicationViewModelInterface) {
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
        setTextFieldsText()
    }
    
    override func navBarRightButtonHandler() {
        // If all fields are not empty call model func -> saveData
        
        if let dayText = Int(dayMeterTextField.text ?? ""), let nightText = Int(nightMeterTextField.text ?? "") {
            let saveModel = StrumIndication(dayMeter: dayText, nightMeter: nightText, transferDate: datePicker.date)
            viewModel.saveIndication(saveModel)
        }
    }
    
    func setTextFieldsText() {
        datePicker.date = viewModel.currentMonth
        guard let mainData = viewModel.mainData else { return }
        self.mainIndication = mainData
        dayMeterTextField.text = "\(mainData.dayMeter)"
        nightMeterTextField.text = "\(mainData.nightMeter)"
        datePicker.date = mainData.transferDate
    }
    
}

//MARK: - MeterStrumViewController setupUI

extension IndicationViewController {
    override func setupViews() {
        view.addToView(stackView)
        stackView.addArrangedSubview(dayMeterLabel)
        stackView.addArrangedSubview(dayMeterTextField)
        stackView.addArrangedSubview(nightMeterLabel)
        stackView.addArrangedSubview(nightMeterTextField)
        
        view.addToView(dateStackView)
        dateStackView.addArrangedSubview(dateLabel)
        dateStackView.addArrangedSubview(datePicker)
        
        datePicker.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
    }
    
    override func constraintsViews() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 150),
            
            dateStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            dateStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateStackView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        title = Constants.title
        addNavBarButton(at: .right, with: "Сохранить")
    }
    
    @objc func handleDatePicker(_ sender: UIDatePicker) {
        let selectedDate = sender.date

        let calendar = Calendar.current
        let componentsMonth = calendar.dateComponents([.month], from: selectedDate)
        let currentComponentsMonth = calendar.dateComponents([.month], from: viewModel.currentMonth)
        if componentsMonth != currentComponentsMonth {
            datePicker.date = viewModel.currentMonth
        }
    }
}
