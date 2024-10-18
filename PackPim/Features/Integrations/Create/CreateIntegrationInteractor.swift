//
//  CreateIntegrationInteractor.swift
//  PackPim
//
//  Created by Kasper Kloster on 08/10/2024.
//

import Foundation

class CreateIntegrationInteractor : CreateIntegrationInteractorProtocol {
    
    func fetchPlatforms() async throws -> [Platform] {        
        return try await PlatformManager.shared.getAllPlatforms()
    }
}