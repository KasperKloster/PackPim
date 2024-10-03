//
//  ProductInteractor.swift
//  PackPim
//
//  Created by Kasper Kloster on 02/10/2024.
//

import Foundation

class ProductInteractor : ProductInteractorProtocol {
    func fetchProducts() -> [Product] {
        return Product.dummyData()
    }
}
