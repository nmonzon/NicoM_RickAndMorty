//
//  HTTPClientError.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 11/2/2024.
//

enum HTTPClientError: Error {
    case serverError
    case clientError
    case generic
    case parsingError
    case invalidURL
    case invalidData
    case responseError
}
