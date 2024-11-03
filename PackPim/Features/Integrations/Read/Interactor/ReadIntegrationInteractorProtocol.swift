//
//  ReadIntegrationInteractorProtocol.swift
//  PackPim
//
//  Created by Kasper Kloster on 27/10/2024.
//


protocol ReadIntegrationInteractorProtocol {
    func fetchIntegration(withId integrationId: String) async throws -> IntegrationDTO
    func fetchApiKey(for integrationId: String) async throws -> String    
    func syncShopifyProducts(withId integrationId : String) async throws

}
