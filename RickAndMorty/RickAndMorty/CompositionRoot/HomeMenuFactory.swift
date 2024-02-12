//
//  HomeMenuFactory.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 11/2/2024.
//

import Foundation

class HomeMenuFactory {
    static func create() -> HomeMenuView {
        return HomeMenuView(viewModel: createViewModel())
    }
    
    private static func createViewModel() -> HomeMenuViewModel {
        return HomeMenuViewModel(getHomeMenuList: createUseCase())
    }
    
    private static func createUseCase() -> GetHomeMenuListType {
        return GetHomeMenuList(repository: createRepository())
    }
    
    private static func createRepository() -> HomeMenuRepositoryType {
        return HomeMenuRepository(datasource: createDatasource(), homeErrorMapper: HomeErrorMapper())
    }
    
    private static func createDatasource() -> HomeMenuDatasourceType {
        
        let httpClient = HTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver())
        
        return HomeMenuDatasource(httpClient: httpClient)
    }
    
}
