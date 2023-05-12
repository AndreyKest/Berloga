//
//  StrumModel.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 26.04.2023.
//

import Foundation

class StrumModel {
    
    //MARK: - constants, variables
    var strumIndication: [StrumIndication]
    
    //MARK: - Services
    fileprivate let yearsAnalysisService: YearsAnalysisService!
    fileprivate let dateService: DateService!
    fileprivate let userDefaultsFacade: UserDefaultsFacade!

    //MARK: - Lazy var
    lazy var yearsArray: [String] = {
        let array = yearsAnalysisService.obtainYears(in: strumIndication)
        return array
    }()

    lazy var currentYear: String = {
        let year = dateService.currentYear()
        return year
    }()

    lazy var currentMonth: Int = {
        let month = dateService.countCurrentMonth()
        return month
    }()
//
//    func getCurrentIndication(indexPath: IndexPath, rowCount: Int) -> FlowIndication? {
//        var indication: FlowIndication?
//        indicationData.forEach {
//            if dateManager.yearFromDate($0.transferDate) == yearsArray[indexPath.section] && dateManager.monthFromDate($0.transferDate) == "\(rowCount+1-indexPath.row)" {
//                indication = FlowIndication(dayMeter: $0.dayMeter, nightMeter: $0.nightMeter, transferDate: $0.transferDate)
//            }
//        }
//        return indication
//    }
    
    init(yearsAnalysisService: YearsAnalysisService = YearsAnalysisServiceImpl(), dateService: DateService = DateServiceImpl(), userDefaultsFacade: UserDefaultsFacade = UserDefaultsFacadeImpl()) {
        
        self.yearsAnalysisService = yearsAnalysisService
        self.dateService = dateService
        self.userDefaultsFacade = userDefaultsFacade
        
        self.strumIndication = self.userDefaultsFacade.fetchData([StrumIndication].self, forKey: R.UserDefaultsKeys.strumIndicationKey) ?? []
    }
}

