//
//  HTTPClient.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 11/2/2024.
//

import Foundation

class HTTPClient: HTTPClientType {
    
    private let session: URLSession
    private let requestMaker: URLSessionRequestMaker
    private let errorResolver: URLSessionErrorResolver
    
    init(session: URLSession = .shared,
         requestMaker: URLSessionRequestMaker,
         errorResolver: URLSessionErrorResolver) {
        
        self.session = session
        self.requestMaker = requestMaker
        self.errorResolver = errorResolver
    }
    
    func makeRequest(endpoint: Endpoint) async -> Result<Data, HTTPClientError> {
        
        do {
            let (data, response) = try await session.data(from: endpoint.url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(.responseError)
            }
            
            guard httpResponse.statusCode == 200 else {
                return .failure(errorResolver.resolve(statusCode: httpResponse.statusCode))
            }
            
            return .success(data)
            
        } catch {
            return .failure(errorResolver.resolve(error: error))
        }
    }
}
