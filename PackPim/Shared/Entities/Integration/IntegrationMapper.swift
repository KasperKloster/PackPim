//
//  IntegrationMapper.swift
//  PackPim
//
//  Created by Kasper Kloster on 20/10/2024.
//

struct IntegrationMapper{
    static func toDTO(_ entity: Integration, platformName: String) -> IntegrationDTO {
        return IntegrationDTO(id: entity.id, name: entity.name, platformName: platformName)
    }
}
