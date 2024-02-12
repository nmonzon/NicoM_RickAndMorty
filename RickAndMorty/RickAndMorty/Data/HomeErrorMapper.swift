//
//  HomeErrorMapper.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 11/2/2024.
//

class HomeErrorMapper {
    func map(error: HTTPClientError?) -> HomeDomainError {
        return .generic
    }
}
