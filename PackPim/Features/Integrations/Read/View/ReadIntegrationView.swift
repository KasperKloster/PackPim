//
//  ReadIntegration.swift
//  PackPim
//
//  Created by Kasper Kloster on 21/10/2024.
//

import SwiftUI

struct ReadIntegrationView: View {
    var integration: IntegrationDTO
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    customHeadLineText("Integration")
                    Text("Use upload products to import a csv")
                    Text("Click sync to sync with API")
                }
                Spacer()
                Button("Upload products", systemImage: "square.and.arrow.up", action: actionBtn)
                Button("Sync products", systemImage: "arrow.trianglehead.2.clockwise.rotate.90", action: actionBtn)
            }
            
        }
        .padding()
    }
}

func actionBtn(){
    return;
}

//#Preview {
//    ReadIntegrationView()
//}
