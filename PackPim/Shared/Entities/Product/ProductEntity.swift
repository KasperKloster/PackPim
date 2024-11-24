//
//  ProductEntity.swift
//  PackPim
//
//  Created by Kasper Kloster on 02/10/2024.
//

import Foundation

struct Product: Identifiable, Encodable {
    let id = UUID()
    let sku: String
    let name: String
    let description: String?
    
    static func dummyData() -> [Product] {
        return [
            Product(sku: "123456", name: "Product 1", description: "asd"),
            Product(sku: "654321", name: "Product 2", description: "asd"),
            Product(sku: "12X456", name: "Product 3", description: "asd"),
        ]
    }
}

