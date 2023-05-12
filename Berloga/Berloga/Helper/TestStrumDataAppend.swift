//
//  TestStrumDataAppend.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 26.04.2023.
//

import Foundation

class TestStrumDataAppend {
    
    static func appendTestData() {
        let userDefaultsFacade: UserDefaultsFacade = UserDefaultsFacadeImpl()
        var strumIndication: [StrumIndication] = []
        strumIndication.append(StrumIndication(dayMeter: 31147, nightMeter: 13597, transferDate: "02/04/2023"))
        userDefaultsFacade.saveData(strumIndication, forKey: R.UserDefaultsKeys.strumIndicationKey)
    }
}
