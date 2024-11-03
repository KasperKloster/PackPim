//
//  IntegrationView.swift
//  PackPim
//
//  Created by Kasper Kloster on 04/10/2024.
//

import SwiftUI

struct IntegrationView: View {
    @ObservedObject var presenter: IntegrationPresenter
    // State to hold the selected integration's ID
    @State private var selectedIntegration: IntegrationDTO.ID?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            customHeadLineText("Integrations")
            
            if presenter.integrations.isEmpty {
                Text("No Integrations..")
            }
            else {
                NavigationStack
                {
                    Table(of: IntegrationDTO.self, selection: $selectedIntegration){
                        TableColumn("Name", value: \.name)
                        TableColumn("Platform", value: \.platformName)
                    } rows: {
                        ForEach(presenter.integrations) { integration in
                            TableRow(integration)
                                .contextMenu {
                                    Button("Edit") {}
                                    Button("See Details", action: {
                                        // Trigger details action for this integration
                                        presenter.didTapReadIntegrationDetails(integrationId: integration.id)
                                    })
                                    Divider()
                                    Button("Delete", role: .destructive) {
                                        Task {
                                            do {
                                                try await presenter.deleteIntegrationDetails(integration: integration)
                                            } catch {
                                                print("Error deleting integration: \(error.localizedDescription)")
                                            }
                                        }
                                    }
                                }
                        }
                    }
                }
                .navigationDestination(isPresented: $presenter.isNavigating){
                    // The destination view
                    presenter.navigationDestination
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
    let integrationRouter = IntegrationRouter()
    let presenter = IntegrationPresenter(router: integrationRouter)
    presenter.interactor = IntegrationInteractor(integrationManager: integrationManager, platformManager: platformManager)
    return IntegrationView(presenter: presenter)
}
