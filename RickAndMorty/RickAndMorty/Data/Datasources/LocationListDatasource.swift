//
//  LocationListDatasource.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

class LocationListDatasource: LocationListDatasourceType {
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getLocationList() async -> Result<[LocationInfoDTO], HTTPClientError> {
        
        let endpoint = Endpoint(path: "/location", queryParameters: [:], method: .get)
        let requestResult = await httpClient.makeRequest(endpoint: endpoint, baseUrl: Endpoint.baseUrl)
        
        guard case .success(let data) = requestResult else {
            guard case .failure(let error) = requestResult else {
                return .failure(.generic)
            }
            return .failure(error)
        }

        do {
            let LocationList = try JSONDecoder().decode(LocationsInfoDTO.self, from: data)
            return .success(LocationList.results)
        } catch {
            return .failure(.parsingError)
        }
    }
    
    
    
}
