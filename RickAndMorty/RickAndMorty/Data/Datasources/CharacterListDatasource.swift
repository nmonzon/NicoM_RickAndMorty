//
//  CharacterListDatasource.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

class CharacterListDatasource: CharacterListDatasourceType {
    
    private let httpClient: HTTPClient
    private var endpoint: Endpoint?
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getCharacterList(characterName: String) async -> Result<[CharacterDTO], HTTPClientError> {
        
        var characterList: [CharacterDTO] = []
        
        guard let url = URL(string: Constants.baseCharacterUrl + "?name=\(characterName)") else {
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
                let characterResult = try JSONDecoder().decode(CharactersDTO.self, from: data)
                characterList += characterResult.results
                
                if let next = characterResult.info.next {
                    currentEndpoint = Endpoint(url: URL(string: next)!)
                } else {
                    currentEndpoint = nil
                }
                
            } catch {
                return .failure(.parsingError)
            }
        }
        return .success(characterList)
    }
    
    func getCharacterList() async -> Result<[CharacterDTO], HTTPClientError> {
        
        if let nextUrlString = UserDefaults.standard.string(forKey: Constants.appStates.loadedNextPage.rawValue), !nextUrlString.isEmpty {
            guard let url = URL(string: nextUrlString) else {
                return .failure(.invalidURL)
            }
            
            let endpoint = Endpoint(url: url)
            let requestResult = await httpClient.makeRequest(endpoint: endpoint)
            
            guard case .success(let data) = requestResult else {
                guard case .failure(let error) = requestResult else {
                    return .failure(.generic)
                }
                return .failure(error)
            }

            do {
                let characterList = try JSONDecoder().decode(CharactersDTO.self, from: data)
                UserDefaults.standard.set(characterList.info.next ?? String(), forKey: Constants.appStates.loadedNextPage.rawValue)
                return .success(characterList.results)
            } catch {
                return .failure(.parsingError)
            }
        } else {
            return .success([])
        }
    }
}
