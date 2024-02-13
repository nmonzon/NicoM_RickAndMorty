//
//  CharactersFactory.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

class LocationsFactory {
    static func create() -> LocationListView {
        LocationListView(viewModel: createViewModel())
    }
    
    static private func createViewModel() -> LocationListViewModel {
        LocationListViewModel(getLocationsList: createUseCase())
    }
    
    static private func createUseCase() -> GetLocationListType {
        GetLocationList(repository: createRepository())
    }
    
    static private func createRepository() -> GetLocationListRepositoryType {
        GetLocationListRepository(
            LocationListDatasource: createDatasource(),
            LocationDomainMapper:  LocationsDomainMapper(),
            LocationDomainErrorMapper: LocationErrorDomainMapper()
        )
    }
    
    static private func createDatasource() -> LocationListDatasourceType {
        LocationListDatasource(
            httpClient: HTTPClient(requestMaker: URLSessionRequestMaker(),
                                   errorResolver: URLSessionErrorResolver())
        )
    }
}
