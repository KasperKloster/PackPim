//
//  PlatformManagerProtocol.swift
//  PackPim
//
//  Created by Kasper Kloster on 18/10/2024.
//

import Foundation

protocol PlatformManagerProtocol {
    func getAllPlatforms() async throws -> [Platform]
    func getPlatformName(platformRef : String) async throws -> String
}
