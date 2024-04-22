//
//  Endpoint.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 11/2/2024.
//
import Foundation

struct Endpoint {
    let url: URL
    let queryParameters: [String: Any]
    let method: HTTPMethod
    
    init(url: URL, method: HTTPMethod = .get, queryParameters: [String : Any] = [:]) {
        self.url = url
        self.method = method
        self.queryParameters = queryParameters
    }

}
