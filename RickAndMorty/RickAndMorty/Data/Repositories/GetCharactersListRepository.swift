//
//  GetCharactersListType.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

class GetCharactersListRepository: GetCharacterListRepositoryType {
    
    private let characterListDatasource: CharacterListDatasourceType
    private let episodeListDatasource: EpisodeListDatasourceType
    private let charactersDomainMapper: CharactersDomainMapper
    private let characterDomainErrorMapper: CharacterErrorDomainMapper
    private let cacheDatasource: CacheCharactersInfoDatasourceType
    
    init(
        characterListDatasource: CharacterListDatasourceType,
        charactersDomainMapper: CharactersDomainMapper,
        characterErrorDomainMapper: CharacterErrorDomainMapper,
        cacheDatasource: CacheCharactersInfoDatasourceType,
        episodeListDatasource: EpisodeListDatasourceType
        
    ) {
        self.characterListDatasource = characterListDatasource
        self.charactersDomainMapper = charactersDomainMapper
        self.characterDomainErrorMapper = characterErrorDomainMapper
        self.cacheDatasource = cacheDatasource
        self.episodeListDatasource = episodeListDatasource
    }
    
    func getCharacterList() async -> Result<[CharacterItem], HomeDomainError> {
        let characterListCache = await cacheDatasource.getCharacterList()
        
        if !characterListCache.isEmpty {
            return .success(characterListCache)
        }
        let characterListResult = await characterListDatasource.getCharacterList()
        let episodeListResult = await episodeListDatasource.getEpisodeList()
        guard case .success(let characterList) = characterListResult else {
            guard case .failure(let error) = characterListResult else {
                return .failure(.generic)
            }
            return .failure(characterDomainErrorMapper.map(error: error))
        }
        
        guard case .success(let episodeList) = episodeListResult else {
            return .success(charactersDomainMapper.findCharactersWithEpisodes(for: characterList, episodes: []))
        }
        
        return .success(charactersDomainMapper.findCharactersWithEpisodes(for: characterList, episodes: episodeList))
    }
    
}

extension GetCharactersListRepository: SearchCharacterListRepositoryType {
    func searchCharacter(characterName: String) async -> Result<[CharacterItem], HomeDomainError> {
        let characterListResult = await getCharacterList()
        
        guard case .success(let characterList) = characterListResult else {
            return characterListResult
        }
        
        guard characterName != "" else {
            return .success(characterList)
        }
        
        let filteredCharacterList = characterList.filter { $0.name.lowercased().contains(characterName.lowercased()) }
        
        return .success(filteredCharacterList)

    }
}
