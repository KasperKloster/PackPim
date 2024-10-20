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
                Table(presenter.integrations){
                    TableColumn("Name", value: \.name)
                    TableColumn("Platform", value: \.platformName)                    
                }
            }
        }
        .navigationTitle("Integrations")
        .onAppear
        {
            Task{
                do {
                    await presenter.loadIntegrations()
                }
            }
        }
    }
}

#Preview {
    let integrationManager = IntegrationManager.shared
    let platformManager = PlatformManager.shared
    let presenter = IntegrationPresenter()
    presenter.interactor = IntegrationInteractor(integrationManager: integrationManager, platformManager: platformManager)
    return IntegrationView(presenter: presenter)
}
