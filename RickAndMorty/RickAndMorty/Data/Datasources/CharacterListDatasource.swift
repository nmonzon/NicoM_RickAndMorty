//
//  CharacterListDatasource.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

class CharacterListDatasource: CharacterListDatasourceType {
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getCharacterList() async -> Result<[CharacterDTO], HTTPClientError> {
        let endpoint = Endpoint(path: "/character", queryParameters: [:], method: .get)
        let requestResult = await httpClient.makeRequest(endpoint: endpoint, baseUrl: Endpoint.baseUrl)
        
        guard case .success(let data) = requestResult else {
            guard case .failure(let error) = requestResult else {
                return .failure(.generic)
            }
            return .failure(error)
        }

        do {
            let characterList = try JSONDecoder().decode(CharactersDTO.self, from: data)
            return .success(characterList.results)
        } catch {
            return .failure(.parsingError)
        }
    }
    
    
}
