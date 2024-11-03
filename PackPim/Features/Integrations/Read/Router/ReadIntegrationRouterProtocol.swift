//
//  ReadIntegrationRouterProtocol.swift
//  PackPim
//
//  Created by Kasper Kloster on 22/10/2024.
//

import SwiftUI

protocol ReadIntegrationRouterProtocol {
    // Create module
    associatedtype V : View
    static func createModule(for integrationId: String) -> V
}

