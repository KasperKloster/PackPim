//
//  CreateIntegrationRouter.swift
//  PackPim
//
//  Created by Kasper Kloster on 06/10/2024.
//

import SwiftUI

class CreateIntegrationRouter {
    static func createModule() -> some View {
        let presenter = CreateIntegrationPresenter()
        let interactor = CreateIntegrationInteractor()
        presenter.interactor = interactor
        let view = CreateIntegrationView(presenter: presenter)
        return view
    }    
}
