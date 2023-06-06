//
//  StrumUseCase.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 05.05.2023.
//

import Foundation

//MARK: - StrumUseCase

protocol StrumUseCase {
    func getStrumIndicationData() -> [StrumIndication]
    
    func getTestIndication() -> [StrumIndication]
    
    func addNewIndication(_ indications: [StrumIndication])
    
    var userDefaultsFacade: UserDefaultsFacade { get }
    
    func getRatesMeter() -> [RateMeter]
    
    func addRateMeter(rate: RateMeter)
}

//MARK: - StrumUseCaseImpl

class StrumUseCaseImpl {
    
    var strumIndication: [StrumIndication] = []
    var ratesMeter: [RateMeter] = []
    
    var userDefaultsFacade: UserDefaultsFacade
    
    init(userDefaultsFacade: UserDefaultsFacade = UserDefaultsFacadeImpl()) {
        self.userDefaultsFacade = userDefaultsFacade
    }
}

//MARK: - StrumUseCase

extension StrumUseCaseImpl: StrumUseCase {
    
    func getStrumIndicationData() -> [StrumIndication] {
        strumIndication = userDefaultsFacade.fetchData([StrumIndication].self, forKey: R.UserDefaultsKeys.strumIndicationKey) ?? []
        return strumIndication
    }
    
    
    func getTestIndication() -> [StrumIndication] {
        return []
    }
    
    func addNewIndication(_ indications: [StrumIndication]) {
        userDefaultsFacade.saveData(indications, forKey: R.UserDefaultsKeys.strumIndicationKey)
    }
    
    func getRatesMeter() -> [RateMeter] {
        ratesMeter = userDefaultsFacade.fetchData([RateMeter].self, forKey: R.UserDefaultsKeys.rateIndicationKey) ?? []
        return ratesMeter
    }
    
    func addRateMeter(rate: RateMeter) {
        var rates = getRatesMeter()
        rates.append(rate)
        userDefaultsFacade.saveData(rates, forKey: R.UserDefaultsKeys.rateIndicationKey)
    }
    
}
