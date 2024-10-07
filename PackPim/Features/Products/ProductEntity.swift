//
//  ProductEntity.swift
//  PackPim
//
//  Created by Kasper Kloster on 02/10/2024.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let sku: String
    let name: String
    
    static func dummyData() -> [Product] {
        return [
            Product(sku: "123456", name: "Product 1"),
            Product(sku: "654321", name: "Product 2"),
            Product(sku: "12X456", name: "Product 3")
        ]
    }
}
