//
//  CreateIntegrationInteractor.swift
//  PackPim
//
//  Created by Kasper Kloster on 08/10/2024.
//

import Foundation

class CreateIntegrationInteractor : CreateIntegrationInteractorProtocol {
    private let platformManager: PlatformManagerProtocol
    private let integrationManager: IntegrationManagerProtocol
    
    // Constructor injection
    init(platformManager: PlatformManagerProtocol, integrationManager: IntegrationManagerProtocol) {
        self.platformManager = platformManager
        self.integrationManager = integrationManager
    }
        
    // Fetching platforms from db to select
    func fetchPlatforms() async throws -> [Platform] {
        return try await platformManager.getAllPlatforms()
    }
    
    // Prepare data to Insert into DB
    func insertIntegration(integrationData : [String : Any]) {        
        // Inserts
        integrationManager.insertIntegration(integrationData: integrationData)
    }
}
