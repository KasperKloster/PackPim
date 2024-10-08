//
//  TestPlatformEntity.swift
//  PackPimTests
//
//  Created by Kasper Kloster on 08/10/2024.
//

import Testing

@Suite("TestPlatformEntity") struct TestPlatformEntity {

    @Test("Sets platform name") func setName() {
        let name = "Shopify"
        let platform = Platform(name: name)
        #expect(platform.name == name)
    }

}
