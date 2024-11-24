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
    
    func fetchAccessToken(for integrationId: String) async throws -> String {
        try await IntegrationManager.shared.getIntegrationAccessToken(withId: integrationId);
    }
    
    func syncShopifyProducts(withId integrationId : String) async throws {
        let accessToken = try await fetchAccessToken(for: integrationId);
        let products = try await ShopifyManager(accessToken: accessToken).getProducts();
        try await IntegrationManager.shared.createProductCollection(integrationId: integrationId, products: products);
    }
        
}
