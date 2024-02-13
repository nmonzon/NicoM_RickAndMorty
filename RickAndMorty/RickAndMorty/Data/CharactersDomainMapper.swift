//
//  CharactersDomainMapper.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

struct CharactersDomainMapper {
    
    func toDomain(characters: [CharacterDTO]) -> [CharacterItem]{
        
        return characters.map({ CharacterItem(
            id: $0.id,
            name: $0.name,
            species: $0.species,
            image: $0.image
        )})
    }
}
