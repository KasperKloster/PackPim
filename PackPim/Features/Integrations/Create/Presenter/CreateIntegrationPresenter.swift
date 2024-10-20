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

    
    func loadPlatforms() async {
        do {
            let fetchedPlatforms = try await interactor?.fetchPlatforms() ?? []
            // Ensure updating happens on the main thread (Publishing changes from background threads is not allowed)
            DispatchQueue.main.async {
                self.platforms = fetchedPlatforms
            }
        } catch {            
            // Print error message to Developers
            print("Failed to load platforms: \(error.localizedDescription)")
        }
    }
    
    func createIntegration(name: String, apiKey: String, platform: Platform?) {
        // Make sure platform has been selected. Stop execution of code if not
        guard let platform else {
            print("You need to select a platform.")
            return
        }        
        // Passed guard? Call the interactor, and insert integration
        interactor?.insertIntegration(name: name, apiKey: apiKey, platform: platform)
    }
    
}
