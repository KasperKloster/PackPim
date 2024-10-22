//
//  ReadIntegrationRouter.swift
//  PackPim
//
//  Created by Kasper Kloster on 21/10/2024.
//

import SwiftUI

class ReadIntegrationRouter : ReadIntegrationRouterProtocol {
    static func createModule (for integration: IntegrationDTO) -> some View {
        return ReadIntegrationView(integration: integration)
    }
    

}
