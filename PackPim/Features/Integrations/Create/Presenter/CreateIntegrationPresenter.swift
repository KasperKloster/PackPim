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
            print("Failed to load platforms: \(error.localizedDescription)")
        }
    }
    
    func insertIntegration() async throws {
        //
    }
}
