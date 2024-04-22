//
//  EpisodeListDatasource.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

class EpisodeListDatasource: EpisodeListDatasourceType {
    
    private let httpClient: HTTPClient
    private var endpoint: Endpoint? = Endpoint(url: URL(string: Constants.baseCharacterUrl)!)
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getEpisodeList() async -> Result<[EpisodeDTO], HTTPClientError> {
        
        var episodeList: [EpisodeDTO] = []
        
        guard let url = URL(string: Constants.baseEpisodeUrl) else {
            return .failure(.invalidURL)
        }
        
        var currentEndpoint: Endpoint? = Endpoint(url: url)
        
        while currentEndpoint != nil {
        
        let requestResult = await httpClient.makeRequest(endpoint: currentEndpoint!)
        
        guard case .success(let data) = requestResult else {
            guard case .failure(let error) = requestResult else {
                return .failure(.generic)
            }
            return .failure(error)
        }

            do {
                let episodeResult = try JSONDecoder().decode(EpisodesDTO.self, from: data)
                episodeList += episodeResult.results
                
                if let next = episodeResult.info.next {
                    currentEndpoint = Endpoint(url: URL(string: next)!)
                } else {
                    currentEndpoint = nil
                }
                
            } catch {
                return .failure(.parsingError)
            }
            
        }
        return .success(episodeList)
    }
    
    
    
}
