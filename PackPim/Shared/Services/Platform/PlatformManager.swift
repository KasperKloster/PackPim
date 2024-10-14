//
//  PlatformManager.swift
//  PackPim
//
//  Created by Kasper Kloster on 09/10/2024.
//


import FirebaseFirestore
// A Singleton
// Final class: Cannot be inherited
final class PlatformManager {
    // Static: Only avaiable wihin the class.
    // Let: is created once, and used thorugh the entire app - It's a singleton (There can only be one instance during app lifetime)
    // And instance of the class, so it can be accessed.
    static let shared = PlatformManager()
    
    private let platformCollection = Firestore.firestore().collection("platforms")
    
    func getAllPlatforms() async throws -> [Platform] {
        var platforms: [Platform] = []
        // Get all documents from the "platforms" collection
        let querySnapshot = try await platformCollection.getDocuments()
        // Iterate through each document and append Platform (as a model) to platforms
        for document in querySnapshot.documents {
            let platform = try document.data(as: Platform.self)
            platforms.append(platform);
        }        
        return platforms
    }
}
