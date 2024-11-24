//
//  IntegrationEntity.swift
//  PackPim
//
//  Created by Kasper Kloster on 04/10/2024.
//

import Foundation


struct Integration  : Identifiable, Decodable {
    // Id will get manually set
    var id : String?
    let name: String
    let accessToken : String?
    let platformRef : String
    
    
    // Exclude 'id' from decoding
    // The CodingKeys enum only includes fields that exist in Firestore (name, apikey etc).
    private enum CodingKeys: String, CodingKey {
        case name
        case accessToken
        case platformRef
    }
    
    // Custom initializer with a default value of nil for apikey
    init(id: String? = nil, name: String, accessToken: String? = nil, platformRef: String) {
        self.id = id
        self.name = name
        self.accessToken = accessToken
        self.platformRef = platformRef
    }
}
