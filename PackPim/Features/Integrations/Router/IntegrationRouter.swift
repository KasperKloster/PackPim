//
//  IntegrationRouter.swift
//  PackPim
//
//  Created by Kasper Kloster on 04/10/2024.
//

import SwiftUI

class IntegrationRouter {
    static func createModule () -> some View {
        let presenter = IntegrationPresenter()
        let interactor = IntegrationInteractor()
        presenter.interactor = interactor
        let view = IntegrationView(presenter: presenter)
        return view;
    }
    
    func navigateToCreateIntegration() -> some View {
        return CreateIntegrationRouter.createModule();
    }
}
