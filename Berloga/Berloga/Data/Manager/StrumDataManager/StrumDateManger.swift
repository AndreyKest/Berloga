//
//  StrumDateManger.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 09.05.2023.
//

import Foundation

//MARK: - StrumDateManger

protocol StrumDateManger {
    //MARK: - YearsSerivce Methods
    func obtainYears<T: StringData>(in data: [T]) -> [String]
    
    //MARK: - DateSerivce Methods
    func currentYear() -> String
    func monthFromDate(_ date: String) -> String
    func yearFromDate(_ date: String) -> String
    func countCurrentMonth() -> Int
}

//MARK: - StrumDateMangerImpl

class StrumDateMangerImpl {
    private let yearsService: YearsAnalysisService
    private let dateService: DateService
    
    init(yearsService: YearsAnalysisService = YearsAnalysisServiceImpl(), dateService: DateService = DateServiceImpl()) {
        self.yearsService = yearsService
        self.dateService = dateService
    }
}

//MARK: - StrumDateManger

extension StrumDateMangerImpl: StrumDateManger {
    func obtainYears<T>(in data: [T]) -> [String] where T : StringData {
        yearsService.obtainYears(in: data)
    }
    
    func currentYear() -> String {
        dateService.currentYear()
    }
    
    func monthFromDate(_ date: String) -> String {
        dateService.monthFromDate(date)
    }
    
    func yearFromDate(_ date: String) -> String {
        dateService.yearFromDate(date)
    }
    
    func countCurrentMonth() -> Int {
        dateService.countCurrentMonth()
    }
    
}
