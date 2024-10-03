//
//  ProductPresenter.swift
//  PackPim
//
//  Created by Kasper Kloster on 02/10/2024.
//

import Foundation

class ProductPresenter : ProductPresenterProtocol, ObservableObject {
    // Reference to interactor
    var interactor: ProductInteractorProtocol?
    
    // Published property for SwiftUI binding
    @Published var products : [Product] = []
    
    // Fetch products from interactor
    func loadProducts() {
        if let products = interactor?.fetchProducts() {
            self.products = products
        }
    }
}
