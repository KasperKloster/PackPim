//
//  IntegrationPresenter.swift
//  PackPim
//
//  Created by Kasper Kloster on 04/10/2024.
//

import Foundation

class IntegrationPresenter : IntegrationPresenterProtocol, ObservableObject {
    var interactor : IntegrationInteractorProtocol?
    
    @Published var integrations : [Integration] = []
    
    func loadIntegrations() {
        if let integrations = interactor?.fetchIntegrations() {
            self.integrations = integrations
        }
    }
    
    func navigateToAddNewIntegration(){
        
    }
}
