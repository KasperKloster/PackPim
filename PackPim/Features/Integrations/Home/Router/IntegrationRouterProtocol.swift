//
//  IntegrationRouterProtocol.swift
//  PackPim
//
//  Created by Kasper Kloster on 06/10/2024.
//

import SwiftUI

protocol IntegrationRouterProtocol {
    // Create module
    associatedtype V: View
    static func createModule() -> V
    // Navigation
    
}
