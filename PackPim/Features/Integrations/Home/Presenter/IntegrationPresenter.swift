//
//  IntegrationPresenter.swift
//  PackPim
//
//  Created by Kasper Kloster on 04/10/2024.
//

import Foundation
import SwiftUICore

class IntegrationPresenter : IntegrationPresenterProtocol, ObservableObject {
    @Published var integrations : [IntegrationDTO] = []
    // Controls navigation state
    @Published var isNavigating : Bool = false
    // Destination for NavigationLink
    @Published var navigationDestination : AnyView?
    var interactor : IntegrationInteractorProtocol?
    private let router : IntegrationRouter?
    init(router: IntegrationRouter) {
        self.router = router
    }
    
    func loadIntegrations() async {
        do {
            let integrations = try await interactor?.fetchIntegrations() ?? []
            let integrationDTOs = try await mapIntegrationDTO(for: integrations)
            // Update on main thread
            DispatchQueue.main.async {
                self.integrations = integrationDTOs
            }
        } catch{
            print("Could not fetch integrations \(error.localizedDescription)")
        }
    }
    
    private func mapIntegrationDTO(for integrations : [Integration]) async throws -> [IntegrationDTO] {
        var integrationDTOs: [IntegrationDTO] = []
        
        for integration in integrations{
            let integrationID = integration.id
            let integrationName = integration.name
            let platformRef = integration.platformRef
            
            // Setting the entity
            let integrationEntity = Integration(
                id: integrationID,
                name: integrationName,
                platformRef : platformRef)
            
            // Getting the name for the platform
            let platformName = try await interactor?.fetchPlatformName(platformRef: integrationEntity.platformRef)
            
            // Map entity to DTO
            let integrationDTO = IntegrationMapper.toDTO(integrationEntity, platformName: platformName!)
            
            // Append
            integrationDTOs.append(integrationDTO)
        }
        return integrationDTOs
    }
    
    func didTapReadIntegrationDetails(integrationId: String){
        // Get the destination view from the router
        let destinationView = router?.navigateToReadIntegration(for: integrationId)
        
        // State updates is on the main thread
        DispatchQueue.main.async {
            // Set the view
            self.navigationDestination = AnyView(destinationView)
            // Activate navigation
            self.isNavigating = true
        }
    }
    
    func editIntegrationDetails(integration: IntegrationDTO) {
        print(integration.id);
    }
    
    func deleteIntegrationDetails(integration: IntegrationDTO) async throws {
        do {
            try await interactor?.deleteIntegration(integrationId: integration.id)
            DispatchQueue.main.async
            {
                // Removes from the UI list immediately
                self.integrations.removeAll { $0.id == integration.id }
            }
        } catch {
            print("Failed to delete integration: \(error.localizedDescription)")
            
        }
        
    }
    
    
}
