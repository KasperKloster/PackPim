//
//  ContentView.swift
//  PackPim
//
//  Created by Kasper Kloster on 02/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List () {
                NavigationLink("Home", destination: HomeView())
                NavigationLink("Products", destination: ProductRouter.createModule())
                NavigationLink("Integrations", destination: IntegrationRouter.createModule())
            }
            .navigationTitle("Menu")
        } detail: {
            Text("Select an option from the menu")
        }
    }
}

#Preview {
    ContentView()
}
