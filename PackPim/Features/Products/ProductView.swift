//
//  ProductView.swift
//  PackPim
//
//  Created by Kasper Kloster on 02/10/2024.
//

import SwiftUI

struct ProductView: View {
    @ObservedObject var presenter: ProductPresenter
            
    var body: some View {
        VStack {
            if presenter.products.isEmpty
            {
                Text("No products available..")
            }
            else
            {
                List(presenter.products) { product in
                    Text(product.name)
                }
            }
        }
        .navigationTitle("Products")
        .onAppear
        {
            // Loads products when the view appears
            presenter.loadProducts()
        }
    }
}

#Preview {
    let presenter = ProductPresenter()
    presenter.interactor = ProductInteractor()
    return ProductView(presenter: presenter)
}
