//
//  ReadIntegrationInteractor.swift
//  PackPim
//
//  Created by Kasper Kloster on 27/10/2024.
//

import Foundation
import FirebaseFirestore

class ReadIntegrationInteractor : ReadIntegrationInteractorProtocol {
        
    func fetchIntegration(withId integrationId: String) async throws -> IntegrationDTO {
        
        try await IntegrationManager.shared.getIntegrations(withId: integrationId);
    }
    
    func fetchApiKey(for integrationId: String) async throws -> String {
        try await IntegrationManager.shared.getIntegrationAPIKey(withId: integrationId);
    }
    
    func syncShopifyProducts(withId integrationId : String) async throws {
        let apiKey = try await fetchApiKey(for: integrationId);
//        let products = ShopifyManager
        return;
    }
    
    
    
    
    
    
}