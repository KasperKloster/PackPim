//
//  ReadIntegration.swift
//  PackPim
//
//  Created by Kasper Kloster on 21/10/2024.
//

import SwiftUI

struct ReadIntegrationView: View {
    @ObservedObject var presenter : ReadIntegrationPresenter
    
    var integrationId: String
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    if let integration = presenter.integrationDetails {
                        customHeadLineText("Integration: \(integration.name)")
                        Text("Platform: \(integration.platformName)")
                        Text("Use upload products to import a CSV")
                        Text("Click sync to sync with API")
                        Spacer()
                        
                        Button("Upload products", systemImage: "square.and.arrow.up", action: actionBtn)
                        
                        Button(action: {
                            Task {
                                try await presenter.syncProducts()
                            }
                        }) {
                            Label("Sync products", systemImage: "arrow.triangle.2.circlepath")
                        }
                        
                        
                    } else {
                        Text("Loading integration details...")
                    }
                }
            }
        }
        .padding()
        .onAppear(){
            Task {
                try await presenter.loadIntegrationDetails()
            }
        }
    }
}

func actionBtn(){
    return;
}

//#Preview {
//    ReadIntegrationView()
//}
