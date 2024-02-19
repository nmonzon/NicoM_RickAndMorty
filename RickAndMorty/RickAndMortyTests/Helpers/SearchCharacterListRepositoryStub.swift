//
//  SearchCharacterListRepositoryStub.swift
//  RickAndMortyTests
//
//  Created by Nicolas Monzon on 18/2/2024.
//

import XCTest
@testable import RickAndMorty

class SearchCharacterListRepositoryStub: SearchCharacterListRepositoryType {
    
    private let result: Result<[CharacterItem], HomeDomainError>
    
    init(result: Result<[CharacterItem], HomeDomainError>) {
        self.result = result
    }
    
    func searchCharacter(characterName: String) async -> Result<[CharacterItem], HomeDomainError> {
        return result
    }
    
}
