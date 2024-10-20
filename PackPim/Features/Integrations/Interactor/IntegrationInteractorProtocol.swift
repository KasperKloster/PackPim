//
//  IntegrationInteractorProtocol.swift
//  PackPim
//
//  Created by Kasper Kloster on 04/10/2024.
//

protocol IntegrationInteractorProtocol {    
    func fetchIntegrations() async throws -> [Integration]
}
