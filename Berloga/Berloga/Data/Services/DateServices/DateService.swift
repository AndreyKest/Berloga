//
//  DateService.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 25.04.2023.
//

import Foundation

protocol DateService {
    
    func getCurrentDate() -> String
    func getStringFromData(date: Date) -> String
    func countCurrentMonth() -> Int
    func currentYear() -> String
    func yearFromDate(_ date: String) -> String
    func monthFromDate(_ date: String) -> String
    func stringToDate(_ stringDate: String) -> Date
}

class DateServiceImpl: DateService {
    
    private var dateFormatter: DateFormatter!
    private var currentDate: Date!
    
    func getCurrentDate() -> String {
        dateFormatter.dateFormat = R.Strings.DateFormat.format
        let dateString = dateFormatter.string(from: currentDate)
        return dateString
    }
    
    func getStringFromData(date: Date) -> String {
        dateFormatter.dateFormat = R.Strings.DateFormat.format
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    func countCurrentMonth() -> Int {
        dateFormatter.dateFormat = R.Strings.DateFormat.monthFormat
        let dateString = dateFormatter.string(from: currentDate)
        let lastYearMonth = 12
        guard let month = Int(dateString) else { return lastYearMonth }
        return month
        
    }
    
    func currentYear() -> String {
        dateFormatter.dateFormat = R.Strings.DateFormat.yearFormat
        let dateString = dateFormatter.string(from: currentDate)
        return dateString
        
    }
    
    func yearFromDate(_ date: String) -> String {
        guard let year = date.components(separatedBy: R.Strings.DateFormat.separator).last else { return "" }
        return year
    }
    
    func monthFromDate(_ date: String) -> String {
        let components = date.components(separatedBy: R.Strings.DateFormat.separator)
        if components.count >= 2, let month = Int(components[1]) {
            return "\(month)"
        }
        return ""
    }
    
    func stringToDate(_ stringDate: String) -> Date {
        dateFormatter.dateFormat = R.Strings.DateFormat.format
        guard let resultDate = dateFormatter.date(from: stringDate) else { return currentDate }
        return resultDate
    }
    
    init(dateFormatter: DateFormatter = DateFormatter(), currentDate: Date = Date()) {
        self.dateFormatter = dateFormatter
        self.currentDate = currentDate
    }
}

