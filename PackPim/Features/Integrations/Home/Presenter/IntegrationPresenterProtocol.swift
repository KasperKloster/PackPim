//
//  IntegrationPresenterProtocol.swift
//  PackPim
//
//  Created by Kasper Kloster on 04/10/2024.
//

import Foundation

protocol IntegrationPresenterProtocol: AnyObject {
    func loadIntegrations() async throws
  
    func didTapReadIntegrationDetails(integration: IntegrationDTO)
    func editIntegrationDetails(integration: IntegrationDTO)
    func deleteIntegrationDetails(integration: IntegrationDTO) async throws
}
