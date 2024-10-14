//
//  PlatformDataSource.swift
//  PackPim
//
//  Created by Kasper Kloster on 08/10/2024.
//

//ObjectDataSource:
//If this service’s main purpose is to provide data (whether from a database, API, or hardcoded source), the DataSource suffix works well.
//It suggests that the class is responsible for fetching the data, regardless of where it comes from.

import Foundation


func platformDataSourceDummyData() -> [Platform] {
    return [
        Platform(id : "1", name: "Shopify"),
        Platform(id : "2", name: "Magento"),
    ]
}
