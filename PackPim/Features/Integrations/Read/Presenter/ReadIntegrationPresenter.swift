//
//  ReadIntegrationPresenter.swift
//  PackPim
//
//  Created by Kasper Kloster on 27/10/2024.
//

import Foundation

class ReadIntegrationPresenter: ObservableObject, ReadIntegrationPresenterProtocol {
    private let integrationId: String
    private let interactor: ReadIntegrationInteractorProtocol
    @Published var integrationDetails: IntegrationDTO?
    
    init(integrationId: String, interactor: ReadIntegrationInteractorProtocol) {
        self.integrationId = integrationId
        self.interactor = interactor
    }
        
    func loadIntegrationDetails() async throws {
        do {
            let details = try await interactor.fetchIntegration(withId: integrationId)
            DispatchQueue.main.async {
                self.integrationDetails = details
            }
        } catch {
            print("Error loading integration details: \(error.localizedDescription)")
        }
    }
    
    func syncProducts() async throws {
        // Use optional binding to safely unwrap integrationDetails
        guard let integrationDetails = integrationDetails else {
            print("Integration details not loaded yet.")
            return
        }
                    
        // Sync depening on platform
        let platformName = integrationDetails.platformName
        
        if platformName.lowercased() == "shopify"
        {
            try await interactor.syncShopifyProducts(withId: integrationDetails.id);
        }
                        
    }
    
}
