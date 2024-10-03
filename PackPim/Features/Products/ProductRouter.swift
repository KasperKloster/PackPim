//
//  ProductRouter.swift
//  PackPim
//
//  Created by Kasper Kloster on 02/10/2024.
//

import SwiftUI

class ProductRouter {
    // Create module that ties every layer together
    static func createModule() -> some View {
        let presenter = ProductPresenter()
        let interactor = ProductInteractor()
        presenter.interactor = interactor
        let view = ProductView(presenter: presenter)
        return view
    }
    // Navigation logic here
}
