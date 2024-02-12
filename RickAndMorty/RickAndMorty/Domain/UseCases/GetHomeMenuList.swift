//
//  GetHomeDataList.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import Foundation

protocol GetHomeMenuListType {
    func execute() async -> Result<HomeMenu, HomeDomainError>
}

class GetHomeMenuList: GetHomeMenuListType {
    
    private let repository: HomeMenuRepositoryType
    
    init(repository: HomeMenuRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<HomeMenu, HomeDomainError> {
        
        let homeMenuResult = await repository.getHomeMenuList()
        
        guard case .success(let homeList) = homeMenuResult else {
            guard case .failure(let error) = homeMenuResult else {
                return .failure(.generic)
            }
            return .failure(error)
        }

        return .success(homeList)
    }
}
