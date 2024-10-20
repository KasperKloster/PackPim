//
//  IntegrationInteractor.swift
//  PackPim
//
//  Created by Kasper Kloster on 04/10/2024.
//

import Foundation

class IntegrationInteractor: IntegrationInteractorProtocol {
    private let integrationManager: IntegrationManagerProtocol
    private let platformManager: PlatformManagerProtocol
    
    // Constructor injection
    init(integrationManager: IntegrationManagerProtocol, platformManager: PlatformManagerProtocol) {
        self.integrationManager = integrationManager
        self.platformManager = platformManager
    }
    
    func fetchIntegrations() async throws -> [Integration] {
        try await integrationManager.getAllIntegrations();        
    }
    
    func fetchPlatformName(platformRef : String) async throws -> String {
        try await platformManager.getPlatformName(platformRef: platformRef);
    }
    
    
}
