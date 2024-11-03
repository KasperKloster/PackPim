//
//  ShopifyProtocol.swift
//  PackPim
//
//  Created by Kasper Kloster on 03/11/2024.
//

import Foundation

protocol ShopifyManagerProtocol {
    func getProducts(with ApiKey : String) async throws
}
