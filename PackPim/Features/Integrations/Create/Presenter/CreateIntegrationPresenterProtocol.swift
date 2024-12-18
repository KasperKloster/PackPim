//
//  CreateIntegrationPresenterProtocol.swift
//  PackPim
//
//  Created by Kasper Kloster on 08/10/2024.
//

import Foundation

protocol CreateIntegrationPresenterProtocol : AnyObject {
    func loadPlatforms() async throws
    func createIntegration(name: String, accessToken: String, platform: Platform?)    
}
