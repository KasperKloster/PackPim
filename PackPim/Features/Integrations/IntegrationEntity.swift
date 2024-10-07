//
//  IntegrationEntity.swift
//  PackPim
//
//  Created by Kasper Kloster on 04/10/2024.
//

import Foundation

struct Integration  : Identifiable {
    let id : UUID = UUID()
    let name: String
    
    static func dummyData() -> [Integration]{
        return [
            Integration(name: "Fake Integration")
        ]
    }
}
