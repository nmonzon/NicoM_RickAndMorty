//
//  GetCharacterListRepository.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

class GetEpisodeListRepository: GetEpisodeListRepositoryType {
    
    private let episodeListDatasource: EpisodeListDatasourceType
    private let episodeDomainMapper: EpisodesDomainMapper
    private let episodeDomainErrorMapper: EpisodeErrorDomainMapper
    
    init(episodeListDatasource: EpisodeListDatasourceType, episodeDomainMapper: EpisodesDomainMapper, episodeDomainErrorMapper: EpisodeErrorDomainMapper) {
        self.episodeListDatasource = episodeListDatasource
        self.episodeDomainMapper = episodeDomainMapper
        self.episodeDomainErrorMapper = episodeDomainErrorMapper
    }
    
    func getEpisodeList() async -> Result<[EpisodeItem], HomeDomainError> {
        
        let episodeListResult = await episodeListDatasource.getEpisodeList()
        
        guard case .success(let episodeList) = episodeListResult else {
            guard case .failure(let error) = episodeListResult else {
                return .failure(.generic)
            }
            return .failure(episodeDomainErrorMapper.map(error: error))

        }
        return .success(episodeDomainMapper.toDomain(episodes: episodeList))

    }
    
    
    
}
