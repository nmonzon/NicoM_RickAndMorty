//
//  GetCharacterListRepository.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

class GetLocationListRepository: GetLocationListRepositoryType {
    
    private let LocationListDatasource: LocationListDatasourceType
    private let LocationDomainMapper: LocationsDomainMapper
    private let LocationDomainErrorMapper: LocationErrorDomainMapper
    
    init(LocationListDatasource: LocationListDatasourceType, LocationDomainMapper: LocationsDomainMapper, LocationDomainErrorMapper: LocationErrorDomainMapper) {
        self.LocationListDatasource = LocationListDatasource
        self.LocationDomainMapper = LocationDomainMapper
        self.LocationDomainErrorMapper = LocationDomainErrorMapper
    }
    
    func getLocationList() async -> Result<[LocationItem], HomeDomainError> {
        
        let LocationListResult = await LocationListDatasource.getLocationList()
        
        guard case .success(let locationList) = LocationListResult else {
            guard case .failure(let error) = LocationListResult else {
                return .failure(.generic)
            }
            return .failure(LocationDomainErrorMapper.map(error: error))

        }
        return .success(LocationDomainMapper.toDomain(locations: locationList))

    }
    
    
    
}
