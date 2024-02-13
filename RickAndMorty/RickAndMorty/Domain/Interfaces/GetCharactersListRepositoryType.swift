//
//  GetCharacterListRepositoryType.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

protocol GetCharacterListRepositoryType {
    func getCharacterList() async -> Result<[CharacterItem], HomeDomainError>
}
