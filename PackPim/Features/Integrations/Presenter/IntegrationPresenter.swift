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
            // Update on main thread
            DispatchQueue.main.async {
                self.integrations = integrations.map{ $0.toDTO() }
            }
        } catch{
            print("Could not fetch integrations \(error.localizedDescription)")
        }
    }    
}
