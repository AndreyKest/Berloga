//
//  IndicationRepository.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 17.05.2023.
//

import Foundation

enum RepositoryStatus {
    case delete
    case cancel
    case add
    case none
}

protocol IndicationRepository {
    func addIndication(_ indication: StrumIndication)
    func getAllIndications() -> [StrumIndication]
    func clearRepository()
    func getStatus() -> RepositoryStatus
    func deleteAction()
}

final class IndicationRepositoryImpl: IndicationRepository {
    static let shared: IndicationRepository = IndicationRepositoryImpl()

    private var indications: [StrumIndication] = []
    private var status: RepositoryStatus = .none

    func addIndication(_ indication: StrumIndication) {
        indications.append(indication)
    }

    func getAllIndications() -> [StrumIndication] {
        return indications
    }
    
    func clearRepository() {
        indications = []
        status = .none
    }
    
    func getStatus() -> RepositoryStatus {
        return status
    }
    
    func deleteAction() {
        status = .delete
    }
    
    private init() {}
}

