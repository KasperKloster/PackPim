//
//  IntegrationRouter.swift
//  PackPim
//
//  Created by Kasper Kloster on 04/10/2024.
//

import SwiftUI

class IntegrationRouter : IntegrationRouterProtocol{
    static func createModule () -> some View {
        let integrationManager = IntegrationManager.shared
        let platformManager = PlatformManager.shared
        
        let integrationRouter = IntegrationRouter()
        
        let presenter = IntegrationPresenter(router: integrationRouter)
        let interactor = IntegrationInteractor(integrationManager: integrationManager, platformManager: platformManager)
        presenter.interactor = interactor
        let view = IntegrationView(presenter: presenter)
        return view;
    }
    
    func navigateToReadIntegration(for integration: IntegrationDTO) -> some View{
        ReadIntegrationRouter.createModule(for: integration);
    }
    
}
