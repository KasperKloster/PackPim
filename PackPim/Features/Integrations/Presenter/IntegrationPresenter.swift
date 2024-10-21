//
//  IntegrationPresenter.swift
//  PackPim
//
//  Created by Kasper Kloster on 04/10/2024.
//

import Foundation

class IntegrationPresenter : IntegrationPresenterProtocol, ObservableObject {
    var interactor : IntegrationInteractorProtocol?
    @Published var integrations : [IntegrationDTO] = []
    
    func loadIntegrations() async {
        do {
            let integrations = try await interactor?.fetchIntegrations() ?? []
            let integrationDTOs = try await setIntegrationDTO(for: integrations)
            // Update on main thread
            DispatchQueue.main.async {
                self.integrations = integrationDTOs
            }
        } catch{
            print("Could not fetch integrations \(error.localizedDescription)")
        }
    }
    
    func setIntegrationDTO(for integrations : [Integration]) async throws -> [IntegrationDTO]{
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
    
    func readIntegrationDetails(integration: IntegrationDTO) {
        print(integration.id!);
    }
    
    func editIntegrationDetails(integration: IntegrationDTO) {
        print(integration.id!);
    }
    
    func deleteIntegrationDetails(integration: IntegrationDTO) async throws {
        do {
            try await interactor?.deleteIntegration(integrationId: integration.id!)
            DispatchQueue.main.async {
                // Removes from the UI list immediately
                self.integrations.removeAll { $0.id == integration.id }
            }
        } catch {
            print("Failed to delete integration: \(error.localizedDescription)")
          
        }
        
    }
    
    
}
