//
//  CreateIntegrationInteractorProtocol.swift
//  PackPim
//
//  Created by Kasper Kloster on 08/10/2024.
//

import Foundation

protocol CreateIntegrationInteractorProtocol: AnyObject {
    func fetchPlatforms() async throws -> [Platform]
    func insertIntegration(integrationData : [String : Any])
    
}
