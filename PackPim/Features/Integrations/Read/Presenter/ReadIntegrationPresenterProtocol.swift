//
//  ReadIntegrationPresenterProtocol.swift
//  PackPim
//
//  Created by Kasper Kloster on 27/10/2024.
//

import Foundation

protocol ReadIntegrationPresenterProtocol {
    func loadIntegrationDetails() async throws
    func syncProducts() async throws
    
    
}
