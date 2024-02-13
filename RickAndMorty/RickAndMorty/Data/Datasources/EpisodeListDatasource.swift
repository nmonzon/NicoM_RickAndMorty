//
//  EpisodeListDatasource.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

class EpisodeListDatasource: EpisodeListDatasourceType {
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getEpisodeList() async -> Result<[EpisodeDTO], HTTPClientError> {
        
        let endpoint = Endpoint(path: "/episode", queryParameters: [:], method: .get)
        let requestResult = await httpClient.makeRequest(endpoint: endpoint, baseUrl: Endpoint.baseUrl)
        
        guard case .success(let data) = requestResult else {
            guard case .failure(let error) = requestResult else {
                return .failure(.generic)
            }
            return .failure(error)
        }

        do {
            let episodeList = try JSONDecoder().decode(EpisodesDTO.self, from: data)
            return .success(episodeList.results)
        } catch {
            return .failure(.parsingError)
        }
    }
    
    
    
}
