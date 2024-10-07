//
//  ProductPresenterProtocol.swift
//  PackPim
//
//  Created by Kasper Kloster on 02/10/2024.
//

import Foundation

protocol ProductPresenterProtocol {
    var products: [Product] { get }
    func loadProducts()
}
