//
//  ProductView.swift
//  PackPim
//
//  Created by Kasper Kloster on 02/10/2024.
//

import SwiftUI

struct ProductView: View {
    @ObservedObject var presenter: ProductPresenter // Concrete type so we can observe changes in @Published property
            
    var body: some View {        
        VStack {
            if presenter.products.isEmpty
            {
                Text("No products available..")
            }
            else {
                Table(presenter.products){
                    TableColumn("SKU", value: \.sku)
                    TableColumn("Name", value: \.name)
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
