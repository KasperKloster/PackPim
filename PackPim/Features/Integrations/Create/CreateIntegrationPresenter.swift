//
//  CreateIntegrationPresenter.swift
//  PackPim
//
//  Created by Kasper Kloster on 08/10/2024.
//

import Foundation


class CreateIntegrationPresenter : CreateIntegrationPresenterProtocol, ObservableObject {
    var interactor : CreateIntegrationInteractorProtocol?
    
    @Published var platforms : [Platform] = []
    
    func loadPlatforms() {
        if let platforms = interactor?.fetchPlatforms() {
            self.platforms = platforms
        }
    }
}
