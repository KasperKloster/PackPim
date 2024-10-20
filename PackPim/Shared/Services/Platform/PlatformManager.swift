//
//  PlatformManager.swift
//  PackPim
//
//  Created by Kasper Kloster on 09/10/2024.
//


import FirebaseFirestore
// A Singleton
// Final class: Cannot be inherited
final class PlatformManager : PlatformManagerProtocol {
    // Static: Only avaiable wihin the class.
    // Let: is created once, and used thorugh the entire app - It's a singleton (There can only be one instance during app lifetime)
    // And instance of the class, so it can be accessed.
    static let shared = PlatformManager()        
    
    // Inject Firestore so we can test using Mock
    private let platformCollection: CollectionReference
    // Default initiazlier using Firestore
    init(platformCollection: CollectionReference = Firestore.firestore().collection("platforms")) {
        self.platformCollection = platformCollection
    }
    
    // Getting all platforms
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
    
    // Fetch the platform name from the Firestore reference
    func getPlatformName(platformRef : String) async throws -> String
    {
        var name : String = ""
        do {
            let platformDocument = try await Firestore.firestore().document(platformRef).getDocument()
            // Check if the document exists and extract the "name" field
            if let documentData = platformDocument.data() {
                name = documentData["name"] as? String ?? "Unknown Name"
            }            
        } catch{
            print("Could not get platform name \(error.localizedDescription)")
        }
        return name
    }
}
