//
//  ProductEntity.swift
//  PackPim
//
//  Created by Kasper Kloster on 02/10/2024.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    
    static func dummyData() -> [Product] {
        return [
            Product(name: "Product 1"),
            Product(name: "Product 2"),
            Product(name: "Product 3")
        ]
    }
}
