//
//  URLSessionRequestMaker.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 11/2/2024.
//

import Foundation

class URLSessionRequestMaker {
    func url(endpoint: Endpoint, baseUrl: String) -> URL?{
        var urlComponents = URLComponents(string: baseUrl + endpoint.path)
        let urlQueryParameters = endpoint.queryParameters.map({URLQueryItem(name: $0.key, value: "\($0.value)")})
        urlComponents?.queryItems = urlQueryParameters
        
        return urlComponents?.url
    }
}
