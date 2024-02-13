//
//  CharactersFactory.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

class EpisodesFactory {
    static func create() -> EpisodeListView {
        EpisodeListView(viewModel: createViewModel())
    }
    
    static private func createViewModel() -> EpisodeListViewModel {
        EpisodeListViewModel(getEpisodesList: createUseCase())
    }
    
    static private func createUseCase() -> GetEpisodeListType {
        GetEpisodeList(repository: createRepository())
    }
    
    static private func createRepository() -> GetEpisodeListRepositoryType {
        GetEpisodeListRepository(
            episodeListDatasource: createDatasource(),
            episodeDomainMapper:  EpisodesDomainMapper(),
            episodeDomainErrorMapper: EpisodeErrorDomainMapper()
        )
    }
    
    static private func createDatasource() -> EpisodeListDatasourceType {
        EpisodeListDatasource(
            httpClient: HTTPClient(requestMaker: URLSessionRequestMaker(),
                                   errorResolver: URLSessionErrorResolver())
        )
    }
}
