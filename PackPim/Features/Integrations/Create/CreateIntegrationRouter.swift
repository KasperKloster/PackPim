//
//  CreateIntegrationRouter.swift
//  PackPim
//
//  Created by Kasper Kloster on 06/10/2024.
//

import SwiftUI

class CreateIntegrationRouter {
    static func createModule() -> some View {
        let platformManager = PlatformManager.shared
        let integrationManager = IntegrationManager.shared
        let interactor = CreateIntegrationInteractor(platformManager: platformManager, integrationManager: integrationManager)
        
        let presenter = CreateIntegrationPresenter()
        presenter.interactor = interactor
        
        let view = CreateIntegrationView(presenter: presenter)
        return view
    }
}
