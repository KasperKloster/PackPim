//
//  CreateIntegrationView.swift
//  PackPim
//
//  Created by Kasper Kloster on 06/10/2024.
//

import SwiftUI

struct CreateIntegrationView: View {
    @ObservedObject var presenter: CreateIntegrationPresenter
    @State private var selectedPlatform: Platform? // Use State to track selected platform
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            // Headline
            customHeadLineText("Create new integration")
            
            // Input fields and picker
            VStack(spacing: 20) {
                TextField("Name", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())  // Make it more visually appealing
                    .padding(.horizontal) // Padding on sides
                
                TextField("APIKey", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Picker("Choose platform", selection: $selectedPlatform) {
                    ForEach(presenter.platforms) { platform in
                        Text(platform.name).tag(platform as Platform?)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.horizontal)
            }
            
            // Create button
            Button(action: {
                // Add action logic here
            }) {
                Text("Create")
                    .padding(10)
            }
            .padding(.horizontal)
            
            Spacer()  // Pushes content upwards, keeps bottom area free
        }
        .navigationTitle("Create new integration")
        .onAppear {
            presenter.loadPlatforms()
        }
    
    }
}

#Preview {
    let presenter = CreateIntegrationPresenter()
    presenter.interactor = CreateIntegrationInteractor()
    return CreateIntegrationView(presenter: presenter)
}
