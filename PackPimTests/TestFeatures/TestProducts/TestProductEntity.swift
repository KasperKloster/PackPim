//
//  TestProductEntity.swift
//  PackPim
//
//  Created by Kasper Kloster on 07/10/2024.
//

import Testing
@testable import PackPim

@Suite("Suite: ProductEntity") struct TestProductEntity {

    @Test("Test: ProductEntity can be initialized") func setProductSkuAndName() async throws {
        let sku = "123456789"
        let name = "Test Product"
        let product = Product(sku: sku, name: name)
        #expect(product.sku == sku)
        #expect(product.name == name)
    }
}
