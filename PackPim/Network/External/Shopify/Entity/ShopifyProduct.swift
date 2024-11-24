//
//  ShopifyProduct.swift
//  PackPim
//
//  Created by Kasper Kloster on 11/11/2024.
//

import Foundation


// Matching the Shopify Json Response, so we can map data { products { edges [ node {} ] }}
struct ShopifyProductResponse: Codable {
    let data: ShopifyProductData
}

struct ShopifyProductData: Codable {
    let products: ShopifyProductEdges
}

struct ShopifyProductEdges: Codable {
    let edges: [ShopifyProductNode]
}

struct ShopifyProductNode: Codable {
    let node: ShopifyProduct
}

// Conform to Codeable, meaning we can encode/decode JSON
struct ShopifyProduct : Codable {
    
    // Properties
    private var id : String
    let title : String
    let description : String
    let variants: ShopifyVariantEdges
    
    // Getting the last part of Shopify ID (gid://shopify/Product/{ID})
    var baseId : String {
        return id.split(separator: "/").last.map(String.init) ?? id;
    }
}

// Getting variants from json properties
struct ShopifyVariantEdges: Codable {
    let edges: [ShopifyVariantNode]
}

struct ShopifyVariantNode: Codable {
    let node: ShopifyVariant
}

struct ShopifyVariant: Codable {
    private var id: String
    let sku: String
    
    var baseId: String {
        return id.split(separator: "/").last.map(String.init) ?? id
    }
}
