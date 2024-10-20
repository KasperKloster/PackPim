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
    let apikey : String?
    
    // Exclude 'id' from decoding
    // The CodingKeys enum only includes fields that exist in Firestore (name and apikey).
    private enum CodingKeys: String, CodingKey {
        case name
        case apikey
    }
}
