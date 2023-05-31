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
    
    private var meterStackView: UIStackView = {
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
    
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.text = "Тариф"
        label.textColor = .white
        return label
    }()
    
    private let rateDayTextField = {
        let textField = UITextField()
        textField.backgroundColor = R.Colors.cellColor
        return textField
    }()
    
    private let rateNightTextField = {
        let textField = UITextField()
        textField.backgroundColor = R.Colors.cellColor
        return textField
    }()
    
    private let rateDayLabel = {
        let label = UILabel()
        label.text = "Дневной тариф:"
        label.textColor = .white
        return label
    }()
    
    private let rateNightLabel = {
        let label = UILabel()
        label.text = "Ночной тариф:"
        label.textColor = .white
        return label
    }()
    
    private let rateStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
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
        
        if let dayText = Int(dayMeterTextField.text ?? ""),
           let nightText = Int(nightMeterTextField.text ?? "") {
            let rate = RateMeter(dayRate: Float(rateDayTextField.text ?? "") ?? viewModel.rate.dayRate,
                                 nightRate: Float(rateNightTextField.text ?? "") ?? viewModel.rate.nightRate,
                                 adoptionDate: datePicker.date)
            let saveModel = StrumIndication(dayMeter: dayText,
                                            nightMeter: nightText,
                                            transferDate: datePicker.date,
                                            rateMeter: rate)
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
        setupMeterStackView()
        setupDateStackView()
        setupRateStackView()
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
    
    func setupMeterStackView() {
        //Add on view
        view.addToView(meterStackView)
        meterStackView.addArrangedSubview(dayMeterLabel)
        meterStackView.addArrangedSubview(dayMeterTextField)
        meterStackView.addArrangedSubview(nightMeterLabel)
        meterStackView.addArrangedSubview(nightMeterTextField)
        //Setup constraints
        NSLayoutConstraint.activate([
            meterStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            meterStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            meterStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            meterStackView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    func setupDateStackView() {
        //Add on view
        view.addToView(dateStackView)
        dateStackView.addArrangedSubview(dateLabel)
        dateStackView.addArrangedSubview(datePicker)
        //Setup constraints
        NSLayoutConstraint.activate([
            dateStackView.topAnchor.constraint(equalTo: meterStackView.bottomAnchor, constant: 10),
            dateStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateStackView.heightAnchor.constraint(equalToConstant: 100),
        ])
        datePicker.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
    }
    
    func setupRateStackView() {
        //Add on view
        view.addToView(rateStackView)
        rateStackView.addArrangedSubview(rateLabel)
        rateStackView.addArrangedSubview(rateDayLabel)
        rateStackView.addArrangedSubview(rateDayTextField)
        rateStackView.addArrangedSubview(rateNightLabel)
        rateStackView.addArrangedSubview(rateNightTextField)
        //Setup constraints
        NSLayoutConstraint.activate([
            rateStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 30),
            rateStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            rateStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rateStackView.heightAnchor.constraint(equalToConstant: 200),
        ])
        rateDayTextField.text = "\(viewModel.rate.dayRate)"
        rateNightTextField.text = "\(viewModel.rate.nightRate)"
    }
}
