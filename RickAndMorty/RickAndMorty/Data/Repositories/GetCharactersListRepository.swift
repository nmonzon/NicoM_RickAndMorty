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
        let characterListResult: Result<[CharacterDTO], HTTPClientError>
        var characterListCache = await cacheDatasource.getCharacterList()
        
        if !UserDefaults.standard.bool(forKey: Constants.appStates.loadMoreItems.rawValue) && !characterListCache.isEmpty {
            if UserDefaults.standard.bool(forKey: Constants.appStates.appDidTerminate.rawValue) {
                UserDefaults.standard.set(false, forKey: Constants.appStates.appDidTerminate.rawValue)
                return .success(characterListCache)
            }else {
                return .success([])
            }
        }
        characterListResult = await characterListDatasource.getCharacterList()
        
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
        
        let characterListDomain = charactersDomainMapper.findCharactersWithEpisodes(for: characterList, episodes: episodeList)
        
        UserDefaults.standard.set(false, forKey: Constants.appStates.loadMoreItems.rawValue)
        characterListCache += characterListDomain
        await cacheDatasource.saveCharacterList(characterListDomain)
        
        return .success(characterListDomain)
    }
    
}

extension GetCharactersListRepository: SearchCharacterListRepositoryType {
    func searchCharacter(characterName: String) async -> Result<[CharacterItem], HomeDomainError> {
        
        let characterListResult: Result<[CharacterDTO], HTTPClientError>
        
        characterListResult = await characterListDatasource.getCharacterList(characterName: characterName)
        
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
        
        let characterListDomain = charactersDomainMapper.findCharactersWithEpisodes(for: characterList, episodes: episodeList)
        
        return .success(characterListDomain)

    }
}
