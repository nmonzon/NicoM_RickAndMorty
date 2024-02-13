//
//  HomeMenuDatasource.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 11/2/2024.
//

import Foundation

class HomeMenuDatasource: HomeMenuDatasourceType {
    
    private let httpClient: HTTPClientType
    
    init(httpClient: HTTPClientType) {
        self.httpClient = httpClient
    }
    
    func getHomeMenuDatasourceData() async -> Result<HomeMenuDTO, HTTPClientError> {
        
        let endpoint = Endpoint(path: "",
                                queryParameters: [:],
                                method: .get)
        
        let homeResult = await httpClient.makeRequest(endpoint: endpoint, baseUrl: Endpoint.baseUrl)
        
        guard case .success(let data) = homeResult else {
            guard case .failure(let error) = homeResult else {
                return .failure(.generic)
            }
            return .failure(error)
        }

        guard let homeListResult = try? JSONDecoder().decode(HomeMenuDTO.self, from: data) else {
            return .failure(.parsingError)
        }
        
        return .success(homeListResult)
    }
    
}
