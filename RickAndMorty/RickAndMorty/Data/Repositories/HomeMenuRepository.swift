//
//  HomeMenuRepository.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import Foundation

class HomeMenuRepository: HomeMenuRepositoryType {
    
    private let homeErrorMapper: HomeErrorMapper
    private let datasource: HomeMenuDatasourceType
    private let homeMenuDomainMapper: HomeMenuDomainMapper
    
    init(datasource: HomeMenuDatasourceType, 
         homeErrorMapper: HomeErrorMapper,
         homeMenuDomainMapper: HomeMenuDomainMapper
    ) {
        self.datasource = datasource
        self.homeErrorMapper = homeErrorMapper
        self.homeMenuDomainMapper = homeMenuDomainMapper
    }
    
    func getHomeMenuList() async -> Result<[HomeMenuItem], HomeDomainError> {
        let homeResult = await datasource.getHomeMenuDatasourceData()
        
        guard case .success(let homeList) = homeResult else {
            return .failure(homeErrorMapper.map(error: homeResult.failureValue as? HTTPClientError))
        }
        
        return .success(homeMenuDomainMapper.toDomain(homeMenuDTO: homeList))
    }
    
}
