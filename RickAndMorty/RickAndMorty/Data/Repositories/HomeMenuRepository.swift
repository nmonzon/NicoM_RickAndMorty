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
    
    init(datasource: HomeMenuDatasourceType, homeErrorMapper: HomeErrorMapper) {
        self.datasource = datasource
        self.homeErrorMapper = homeErrorMapper
    }
    
    func getHomeMenuList() async -> Result<HomeMenu, HomeDomainError> {
        let homeResult = await datasource.getHomeMenuDatasourceData()
        
        guard case .success(let homeList) = homeResult else {
            return .failure(homeErrorMapper.map(error: homeResult.failureValue as? HTTPClientError))
        }
        
        return .success(HomeMenu(characters: homeList.characters, locations: homeList.locations, episodes: homeList.episodes))
    }
    
}
