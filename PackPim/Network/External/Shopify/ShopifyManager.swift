//
//  Shopify.swift
//  PackPim
//
//  Created by Kasper Kloster on 03/11/2024.
//

import Foundation

class ShopifyManager : ShopifyManagerProtocol {
    private let baseURL = URL(string: "https://dev-urrem.myshopify.com/admin/api/2024-10/graphql.json")!
        
    private func createRequest(apiKey: String) -> URLRequest {
        var request = URLRequest(url: baseURL)
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func getProducts(with apiKey : String) async throws {
        return;
    }
    
    
}
