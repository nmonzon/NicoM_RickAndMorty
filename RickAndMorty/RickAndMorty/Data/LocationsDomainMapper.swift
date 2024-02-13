//
//  LocationsDomainMapper.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

struct LocationsDomainMapper {
    
    func toDomain(locations: [LocationInfoDTO]) -> [LocationItem]{
        
        return locations.map({
            LocationItem(
                id: $0.id,
                name: $0.name,
                type: $0.type,
                dimension: $0.dimension,
                residents: $0.residents,
                url: $0.url,
                created: $0.created) })
    }
}

