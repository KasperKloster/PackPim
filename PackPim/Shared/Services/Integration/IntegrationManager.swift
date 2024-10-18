//
//  IntegrationManager.swift
//  PackPim
//
//  Created by Kasper Kloster on 18/10/2024.
//


import FirebaseFirestore
// Singleton
final class IntegrationManager : IntegrationManagerProtocol{

    static let shared = IntegrationManager()
    
    // Inject Firestore so we can test using Mock
    private let integrationCollection: CollectionReference
    init(integrationCollection: CollectionReference = Firestore.firestore().collection("integrations")) {
        self.integrationCollection = integrationCollection
    }
    
    func insertIntegration(integrationData : [String: Any]){
        integrationCollection.addDocument(data: integrationData){ error in
            if let error = error {
                print("Error adding integration to Firestore: \(error.localizedDescription)")
            } else {
                print("Integration created successfully!")
            }
        }
    }

}

