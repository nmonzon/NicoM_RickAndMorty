//
//  CharacterErrorDomainMapper.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

class CharacterErrorDomainMapper {
    func map(error: HTTPClientError) -> HomeDomainError {
        return .generic
    }
    
}
