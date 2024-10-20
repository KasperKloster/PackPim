//
//  IntegrationInteractor.swift
//  PackPim
//
//  Created by Kasper Kloster on 04/10/2024.
//

import Foundation

class IntegrationInteractor: IntegrationInteractorProtocol {
    private let integrationManager: IntegrationManagerProtocol
    
    // Constructor injection
    init(integrationManager: IntegrationManagerProtocol) {
        self.integrationManager = integrationManager
    }
    
    func fetchIntegrations() async throws -> [Integration] {
        try await integrationManager.getAllIntegrations();        
    }
}
