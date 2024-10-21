//
//  IntegrationInteractorProtocol.swift
//  PackPim
//
//  Created by Kasper Kloster on 04/10/2024.
//

protocol IntegrationInteractorProtocol {
    func fetchIntegrations() async throws -> [Integration]
    func fetchPlatformName(platformRef : String) async throws -> String
    func getIntegration(integration : IntegrationDTO)
    func deleteIntegration(integrationId : String) async throws
    
}
