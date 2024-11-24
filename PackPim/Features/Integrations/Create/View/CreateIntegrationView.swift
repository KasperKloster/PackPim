//
//  CreateIntegrationView.swift
//  PackPim
//
//  Created by Kasper Kloster on 06/10/2024.
//

import SwiftUI

struct CreateIntegrationView: View {
    @ObservedObject var presenter: CreateIntegrationPresenter
    // State to track selected platform
    @State private var selectedPlatform: Platform? = nil
    // States to get user inputs
    @State private var integrationName: String = ""
    @State private var accessToken: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            // Headline
            customHeadLineText("Create new integration")
            
            // Input fields and picker
            VStack(spacing: 20) {
                TextField("Name", text: $integrationName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Admin API access token", text: $accessToken)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Picker("Choose platform", selection: $selectedPlatform) {
                    // Default option for no selection
                    Text("Select platform").tag(nil as Platform?)
                    // Each platform
                    ForEach(presenter.platforms) { platform in
                        Text(platform.name).tag(platform as Platform?)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.horizontal)
            }
            
            // Create / submit button
            Button(action: {
                // When button has been clicked. Send this to the presenter
                presenter.createIntegration(
                    name: integrationName,
                    accessToken: accessToken,
                    platform: selectedPlatform)
                
            }) {
                Text("Create")
                    .padding(10)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationTitle("Create new integration")
        .onAppear {
            Task{
                do {
                    await presenter.loadPlatforms()
                } 
            }
        }
    }
}

#Preview {
    let platformManager = PlatformManager.shared
    let integrationManager = IntegrationManager.shared
    let presenter = CreateIntegrationPresenter()
    presenter.interactor = CreateIntegrationInteractor(platformManager: platformManager, integrationManager: integrationManager)
    return CreateIntegrationView(presenter: presenter)
}
