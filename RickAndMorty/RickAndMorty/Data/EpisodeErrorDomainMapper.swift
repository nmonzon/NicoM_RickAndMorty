//
//  EpisodeErrorDomainMapper.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 13/2/2024.
//

import Foundation

class EpisodeErrorDomainMapper {
    func map(error: HTTPClientError) -> HomeDomainError {
        return .generic
    }
    
}
