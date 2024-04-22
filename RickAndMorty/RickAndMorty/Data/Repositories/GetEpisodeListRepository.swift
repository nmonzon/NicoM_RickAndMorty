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
    private let characterListDatasource: CharacterListDatasourceType
    
    init(
        episodeListDatasource: EpisodeListDatasourceType,
        episodeDomainMapper: EpisodesDomainMapper,
        episodeDomainErrorMapper: EpisodeErrorDomainMapper,
        characterListDatasource: CharacterListDatasourceType
    ) {
        self.episodeListDatasource = episodeListDatasource
        self.episodeDomainMapper = episodeDomainMapper
        self.episodeDomainErrorMapper = episodeDomainErrorMapper
        self.characterListDatasource = characterListDatasource
    }
    
    func getEpisodeList() async -> Result<[EpisodeItem], HomeDomainError> {
        
        let episodeListResult = await episodeListDatasource.getEpisodeList()
        //let characterListResult = await characterListDatasource.getCharacterList()
        
        guard case .success(let episodeList) = episodeListResult else {
            guard case .failure(let error) = episodeListResult else {
                return .failure(.generic)
            }
            return .failure(episodeDomainErrorMapper.map(error: error))

        }
        return .success(episodeDomainMapper.findCharactersWithEpisodes(for: [], episodes: episodeList))
//        guard case .success(let characterList) = characterListResult else {
//            return .success(episodeDomainMapper.findCharactersWithEpisodes(for: [], episodes: episodeList))
//        }
        
//        return .success(episodeDomainMapper.findCharactersWithEpisodes(for: characterList, episodes: episodeList))

    }
    
    
    
}
