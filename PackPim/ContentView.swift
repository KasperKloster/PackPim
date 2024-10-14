//
//  ContentView.swift
//  PackPim
//
//  Created by Kasper Kloster on 02/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isProductsExpanded: Bool = true
    @State private var isIntegrationsExpanded: Bool = true
    
    var body: some View {
        NavigationSplitView {
            List{
                NavigationLink("Home", destination: HomeView())
                
                DisclosureGroup("Products", isExpanded: $isProductsExpanded){
                    NavigationLink("Products", destination: ProductRouter.createModule())
                }
                DisclosureGroup("Integrations", isExpanded: $isIntegrationsExpanded){
                    NavigationLink("Integrations", destination: IntegrationRouter.createModule())
                    NavigationLink("Add new integrattion", destination: CreateIntegrationRouter.createModule())
                }
            }            
        } detail: {
            Text("Select an option from the menu")
        }
    }

}

#Preview {
    ContentView()
}
