//
//  GetCharacterListRepository.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

class GetLocationListRepository: GetLocationListRepositoryType {
    
    private let locationListDatasource: LocationListDatasourceType
    private let locationDomainMapper: LocationsDomainMapper
    private let locationDomainErrorMapper: LocationErrorDomainMapper
    private let characterListDatasource: CharacterListDatasourceType
    
    init(
        locationListDatasource: LocationListDatasourceType,
        locationDomainMapper: LocationsDomainMapper,
        locationDomainErrorMapper: LocationErrorDomainMapper,
        characterListDatasource: CharacterListDatasourceType
    ) {
        self.locationListDatasource = locationListDatasource
        self.locationDomainMapper = locationDomainMapper
        self.locationDomainErrorMapper = locationDomainErrorMapper
        self.characterListDatasource = characterListDatasource
    }
    
    func getLocationList() async -> Result<[LocationItem], HomeDomainError> {
        
        let locationListResult = await locationListDatasource.getLocationList()
        let characterListResult = await characterListDatasource.getCharacterList()
        
        guard case .success(let locationList) = locationListResult else {
            guard case .failure(let error) = locationListResult else {
                return .failure(.generic)
            }
            return .failure(locationDomainErrorMapper.map(error: error))

        }
        
        guard case .success(let characterList) = characterListResult else {
            return .success(locationDomainMapper.findCharactersWithLocations(for: [], locations: locationList))
        }
        
        return .success(locationDomainMapper.findCharactersWithLocations(for: characterList, locations: locationList))

    }
    
    
    
}
