//
//  SearchCharacterListRepositoryType.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 17/2/2024.
//

import Foundation

protocol SearchCharacterListRepositoryType {
    func searchCharacter(characterName: String) async -> Result<[CharacterItem], HomeDomainError>
}
