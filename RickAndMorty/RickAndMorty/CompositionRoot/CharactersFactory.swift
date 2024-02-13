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
        CharacterListViewModel(getCharactersList: createUseCase())
    }
    
    static private func createUseCase() -> GetCharactersListType {
        GetCharactersList(repository: createRepository())
    }
    
    static private func createRepository() -> GetCharacterListRepositoryType {
        GetCharactersListRepository(
            characterListDatasource: createDatasource(),
            charactersDomainMapper: CharactersDomainMapper(),
            characterErrorDomainMapper: CharacterErrorDomainMapper()
        )
    }
    
    static private func createDatasource() -> CharacterListDatasourceType {
        CharacterListDatasource(
            httpClient: HTTPClient(requestMaker: URLSessionRequestMaker(), 
                                   errorResolver: URLSessionErrorResolver())
        )
    }
}
