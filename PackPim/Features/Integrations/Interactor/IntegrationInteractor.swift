//
//  IntegrationInteractor.swift
//  PackPim
//
//  Created by Kasper Kloster on 04/10/2024.
//

import Foundation

class IntegrationInteractor: IntegrationInteractorProtocol {
    func fetchIntegrations() -> [Integration] {
        return Integration.dummyData();
    }        
}
