//
//  GetEpisodeList.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

protocol GetEpisodeListType {
    func execute() async -> Result<[EpisodeItem], HomeDomainError>
}

class GetEpisodeList: GetEpisodeListType {
    
    private let repository: GetEpisodeListRepositoryType
    
    init(repository: GetEpisodeListRepositoryType) {
        self.repository = repository
    }

    
    func execute() async -> Result<[EpisodeItem], HomeDomainError> {
        
        let episodeListResult = await repository.getEpisodeList()
        
        guard case .success(let episodeList) = episodeListResult else {
            guard case .failure(let error) = episodeListResult else {
                return .failure(.generic)
            }
            return .failure(error)
        }

        return .success(episodeList)
    }
    
    
    
}
