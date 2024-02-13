//
//  GetLocationList.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

protocol GetLocationListType {
    func execute() async -> Result<[LocationItem], HomeDomainError>
}

class GetLocationList: GetLocationListType {
    
    private let repository: GetLocationListRepositoryType
    
    init(repository: GetLocationListRepositoryType) {
        self.repository = repository
    }

    
    func execute() async -> Result<[LocationItem], HomeDomainError> {
        
        let LocationListResult = await repository.getLocationList()
        
        guard case .success(let LocationList) = LocationListResult else {
            guard case .failure(let error) = LocationListResult else {
                return .failure(.generic)
            }
            return .failure(error)
        }

        return .success(LocationList)
    }
    
    
    
}

