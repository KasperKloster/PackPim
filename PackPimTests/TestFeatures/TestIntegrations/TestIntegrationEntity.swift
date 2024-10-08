//
//  TestIntegrationEntity.swift
//  PackPim
//
//  Created by Kasper Kloster on 08/10/2024.
//

import Testing
@testable import PackPim

@Suite("Suite: TestIntegrationEntity") struct TestIntegrationEntity {

    @Test("Test: Set Integration Name") func setIntegrationName() {
        let name = "Shopify"
        let apiKey = "123456789"
        let integration = Integration(name: name, apikey: apiKey)
        #expect(integration.name == name)
        #expect(integration.apikey == apiKey)
    }

}
