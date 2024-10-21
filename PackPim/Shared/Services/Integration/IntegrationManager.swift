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
    
    func insertIntegration(integrationData : [String: Any])
    {
        integrationCollection.addDocument(data: integrationData){ error in
            if let error = error {
                print("Error adding integration to Firestore: \(error.localizedDescription)")
            } else {
                print("Integration created successfully!")
            }
        }
    }
    
    func getAllIntegrations() async throws -> [Integration] {
        var integrations : [Integration] = []
        
        do {
            let querySnapshot = try await integrationCollection.getDocuments();
            
            for document in querySnapshot.documents {
                // Decode the document fields into an Integration object, (excluding the 'id' - See Entity)
                var integration = try document.data(as: Integration.self)
                // Manually set ID
                integration.id = document.documentID
                // Append
                integrations.append(integration)
            }
            
        } catch {
            print("Error getting documents: \(error)")
        }
        return integrations;
    }
    
    func deleteIntegration(integrationId : String)  async throws{        
        try await integrationCollection.document(integrationId).delete()
        print("Integration deleted successfully")
    }

}

