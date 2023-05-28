//
//  YearsAnalysisService.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 25.04.2023.
//

import Foundation

protocol YearsAnalysisService {
    
    func obtainYears<T: StringData>(in data: [T]) -> [String]
    func nextDate<T: StringData>(after date: T, in dates: [T]) -> T?
}

class YearsAnalysisServiceImpl: YearsAnalysisService {
    
    func obtainYears<T: StringData>(in data: [T]) -> [String] {
            var uniqueYears: Set<String> = []
            for value in data {
                let calendar = Calendar.current
                let year = calendar.component(.year, from: value.transferDate)
                uniqueYears.insert("\(year)")
            }
            let sortedYears = uniqueYears.sorted(by: >)
            return sortedYears
        }
    
    func nextDate<T: StringData>(after date: T, in dates: [T]) -> T? {
        guard let index = dates.firstIndex(of: date),
              let next = dates[safe: index + 1]
        else {
            return nil
        }
        return next
    }
}

