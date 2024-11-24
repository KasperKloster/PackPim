//
//  Shopify.swift
//  PackPim
//
//  Created by Kasper Kloster on 03/11/2024.
//

import Foundation

class ShopifyManager : ShopifyManagerProtocol {
    private let endpoint = URL(string: "https://dev-urrem.myshopify.com/admin/api/2024-01/graphql.json")!
    private let accessToken : String
    
    // Initialize with the access token
    init(accessToken: String) {
        self.accessToken = accessToken
    }
    
    // Method to create request with headers
    private func createRequest() -> URLRequest {
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.addValue("\(accessToken)", forHTTPHeaderField: "X-Shopify-Access-Token")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func getProducts() async throws -> [Product] {
        var request = createRequest();
                                
        // Define the GraphQL query
        let query = """
        {
            products(first: 2) {
                edges {
                    node {
                        id                        
                        title
                        description
                        variants (first: 2) {
                            edges {
                                node {
                                    id
                                    sku                                    
                                }
                            }
                        }
                    }
                }
            }
        }
        """
        
        // Set the request body with the GraphQL query
        request.httpBody = try JSONSerialization.data(withJSONObject: ["query": query])
        
        // GET Request. Perform the HTTP request (async). Data is raw data. Response, metadata about the HTTP response.
        let (data, response) = try await URLSession.shared.data(for: request);
                
        // Check the reponse code, has to be within 200..299
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        // Decode JSON respoonse, into list of object
        do {
            var products : [Product] = []
            // Response to string / Debugging purposes
            // let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []);
            // print(jsonResponse);
            
            // Decode the data into the structured response model
            let decodedResponse = try JSONDecoder().decode(ShopifyProductResponse.self, from: data)
            let productResponse = decodedResponse.data.products.edges.map { $0.node }
            
            for product in productResponse {
                // Get properties from base/main product
                let title : String = product.title
                let description : String = product.description
                // Initialize product from each variant (We can get the SKU for each product)
                for variant in product.variants.edges {
                    let sku : String = variant.node.sku
                    let product = Product(sku: sku, name: title, description: description)
                    // Append to all prodcuts
                    products.append(product);
                }
            }
            
            return products;
            
            
        } catch {
            print("Failed to decode Shopify Product JSON: \(error)");
            throw error;
        }
        
    }
}
