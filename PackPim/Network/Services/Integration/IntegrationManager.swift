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

    func getIntegrations(withId integrationId: String) async throws -> IntegrationDTO {
        let document = try await integrationCollection.document(integrationId).getDocument();
        
        guard let data = document.data() else {
            print("No data found in document.")
            throw NSError(domain: "IntegrationError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Integration not found"])
        }

        guard let name = data["name"] as? String else {
            print("Name not found or is not a String")
            throw NSError(domain: "IntegrationError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Integration not found"])
        }

        guard let platformRef = data["platformRef"] as? String else {
            print("PlatformReference not found or is not a String")
            throw NSError(domain: "IntegrationError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Integration not found"])
        }
        // Get platform name from reference
        let platformName = try await PlatformManager.shared.getPlatformName(platformRef: platformRef);

        return IntegrationDTO(id: integrationId, name: name, platformName: platformName);
        
    }
    
    func deleteIntegration(integrationId : String)  async throws{
        try await integrationCollection.document(integrationId).delete()
        print("Integration deleted successfully")
    }
    
    func getIntegrationAccessToken(withId integrationId : String) async throws -> String {
        let document = try await integrationCollection.document(integrationId).getDocument();
        guard let data = document.data() else {
            print("No data found in document.")
            throw NSError(domain: "IntegrationError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Integration not found"])
        }

        guard let apiKey = data["accessToken"] as? String else {
            print("Column: AccessToken not found")
            throw NSError(domain: "IntegrationError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Integration not found"])
        }
                
        return apiKey;
    }
    
    func createProductCollection(integrationId : String, products : [Product]) async throws{
        // Products document
        do {
            for product in products {
                try integrationCollection.document(integrationId).collection("products").document(product.sku).setData(from: product)
            }
        } catch {
            print("Error with adding products to integration")
        }
    }
}
