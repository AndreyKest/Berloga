//
//  PrepareIndicationService.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 18.05.2023.
//

import Foundation

//Status enum

private enum ChangeStatus {
    case succes
    case fail
}

//MARK: - PrepareIndicationService protocol

protocol PrepareIndicationService {
    func prepareIndication(_ indicationArray: [StrumIndication], indication: StrumIndication?, indicationStatus: IndicationStatus) -> [StrumIndication]
}

//MARK: - PrepareIndicationService

final class PrepareIndicationServiceImpl {
    
    lazy var dateFormatter = DateFormatter()
    
    var strumIndication: [StrumIndication] = []
    
    var dateManager: StrumDateManger?
    
    init(dateManager: StrumDateManger = StrumDateMangerImpl()) {
        self.dateManager = dateManager
    }
    
    private func changeData(_ data: StrumIndication?, status: IndicationStatus) {
        guard let indication = data else { return }
        switch status {
        case .change:
            if change(indication) == .fail {
                break
            }
        case .add:
            if change(indication) == .succes {
                break
            } else {
                guard let data = data else { break }
                strumIndication.append(data)
                strumIndication = sortedDataArray(strumIndication)
            }
        case .delete:
            guard let data = data else { break }
            strumIndication.removeAll(where: { $0 == data })
        case .none:
            break
        }
    }
    
    private func change(_ data: StrumIndication) -> ChangeStatus {
        if let indiactionValue = strumIndication.enumerated().first(where: { dateManager?.monthFromDate($0.element.transferDate) == dateManager?.monthFromDate(data.transferDate) && dateManager?.yearFromDate($0.element.transferDate) == dateManager?.yearFromDate(data.transferDate) }) {
            
            strumIndication.remove(at: indiactionValue.offset)
            strumIndication.insert(data, at: indiactionValue.offset)
            
            return .succes
        }
        return .fail
    }
    
    private func sortedDataArray(_ data: [StrumIndication]) -> [StrumIndication] {
        let sortData = data.sorted { firstValue, secondValue in
            return firstValue.transferDate > secondValue.transferDate
        }
        return sortData
    }
    
}

//MARK: - PrepareIndicationService

extension PrepareIndicationServiceImpl: PrepareIndicationService {
    func prepareIndication(_ indicationArray: [StrumIndication], indication: StrumIndication?, indicationStatus: IndicationStatus) -> [StrumIndication] {
        
        loadIndications(indicationArray: indicationArray)
        
        changeData(indication, status: indicationStatus)
        
        return strumIndication
        
    }
    
    private func loadIndications(indicationArray: [StrumIndication]) {
        strumIndication = indicationArray
    }
}
