//
//  IntegrationView.swift
//  PackPim
//
//  Created by Kasper Kloster on 04/10/2024.
//

import SwiftUI

struct IntegrationView: View {
    @ObservedObject var presenter: IntegrationPresenter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            customHeadLineText("Integrations")
            
            if presenter.integrations.isEmpty {
                Text("No Integrations..")
            }
            else {
                List(presenter.integrations) { integration in
                    Text(integration.name)
                }
            }
        }
        .navigationTitle("Integrations")
        .onAppear
        {
            presenter.loadIntegrations()
        }
        
    }
}

#Preview {
    let presenter = IntegrationPresenter()
    presenter.interactor = IntegrationInteractor()
    return IntegrationView(presenter: presenter)
}
