//
//  ProductInteractorProtocol.swift
//  PackPim
//
//  Created by Kasper Kloster on 02/10/2024.
//

import Foundation

protocol ProductInteractorProtocol : AnyObject{
    func fetchProducts() -> [Product]
}
