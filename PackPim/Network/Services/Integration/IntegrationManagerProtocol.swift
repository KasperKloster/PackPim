//
//  IntegrationManagerProtocol.swift
//  PackPim
//
//  Created by Kasper Kloster on 18/10/2024.
//

import Foundation

protocol IntegrationManagerProtocol {
    func insertIntegration(integrationData : [String: Any])
    func getAllIntegrations() async throws -> [Integration]
    func getIntegrations(withId integrationId: String) async throws -> IntegrationDTO
    func deleteIntegration(integrationId : String) async throws
    func getIntegrationAccessToken(withId integrationId: String) async throws -> String
    func createProductCollection(integrationId : String, products : [Product]) async throws
}
