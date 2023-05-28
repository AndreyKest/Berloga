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
    func monthFromDate(_ date: Date) -> String
    func yearFromDate(_ date: Date) -> String
    func countCurrentMonth() -> Int
    func getStringFromData(date: Date) -> String
    func getDateFromString(_ string: String) -> Date
    func getDateFromComponents(year: Int, month: Int) -> Date
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
    
    func monthFromDate(_ date: Date) -> String {
        dateService.monthFromDate(date)
    }
    
    func yearFromDate(_ date: Date) -> String {
        dateService.yearFromDate(date)
    }
    
    func countCurrentMonth() -> Int {
        dateService.countCurrentMonth()
    }
    
    func getStringFromData(date: Date) -> String {
        dateService.getStringFromData(date: date)
    }
    
    func getDateFromString(_ string: String) -> Date {
        dateService.getDateFromString(string)
    }
    
    func getDateFromComponents(year: Int, month: Int) -> Date {
        dateService.getDateFromComponents(year: year, month: month)
    }
    
}
