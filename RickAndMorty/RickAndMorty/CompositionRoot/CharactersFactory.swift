//
//  CharactersFactory.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

class CharactersFactory {
    static func create() -> CharacterListView {
        CharacterListView(viewModel: createViewModel())
    }
    
    static private func createViewModel() -> CharacterListViewModel {
        CharacterListViewModel(getCharactersList: createUseCase(), searchCharacterList: createUseCaseSearchCharacterList())
    }
    
    static private func createUseCaseSearchCharacterList() -> SearchCharacterListType {
        SearchCharacterList(repository: createRepository())
    }
    
    static private func createUseCase() -> GetCharactersListType {
        GetCharactersList(repository: createRepository())
    }
    
    static private func createRepository() -> GetCharactersListRepository {
        GetCharactersListRepository(
            characterListDatasource: createDatasource(),
            charactersDomainMapper: CharactersDomainMapper(),
            characterErrorDomainMapper: CharacterErrorDomainMapper(), cacheDatasource: createCacheDatasource(), episodeListDatasource: createEpisodeDatasource())
    }
    
    private static func createCacheDatasource() -> CacheCharactersInfoDatasourceType {
        StrategyCacheCharacters(temporalCache: InMemoryCacheCharactersInfoDatasource.shared, persistanceCache: createPersistanceCacheDatasource())
    }
    
    private static func createPersistanceCacheDatasource() -> CacheCharactersInfoDatasourceType {
        return SwiftDataCacheCharacterItemList(container: SwiftDataContainer.shared)
    }
            
            static private func createEpisodeDatasource() -> EpisodeListDatasourceType {
                return EpisodeListDatasource(httpClient: HTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver()))
            }
    
    static private func createDatasource() -> CharacterListDatasourceType {
        CharacterListDatasource(
            httpClient: HTTPClient(requestMaker: URLSessionRequestMaker(), 
                                   errorResolver: URLSessionErrorResolver())
        )
    }
}
