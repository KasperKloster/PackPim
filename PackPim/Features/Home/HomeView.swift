//
//  HomeView.swift
//  PackPim
//
//  Created by Kasper Kloster on 02/10/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            customHeadLineText("Home")
        }
        .navigationTitle("Home")
    }
}

#Preview {
    HomeView()
}
