//
//  ReadIntegrationRouter.swift
//  PackPim
//
//  Created by Kasper Kloster on 21/10/2024.
//

import SwiftUI

class ReadIntegrationRouter : ReadIntegrationRouterProtocol {
    static func createModule (for integrationId: String) -> some View {
        let interactor = ReadIntegrationInteractor()
        let presenter = ReadIntegrationPresenter(integrationId: integrationId, interactor: interactor)
        
        let view = ReadIntegrationView(presenter: presenter, integrationId: integrationId)
        
        return view
    }
    

}
