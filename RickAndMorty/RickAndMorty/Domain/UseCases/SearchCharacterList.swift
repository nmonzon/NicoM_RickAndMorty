//
//  SearchCharacterList.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 17/2/2024.
//

import Foundation

protocol SearchCharacterListType {
    func execute(characterName: String) async -> Result<[CharacterItem], HomeDomainError>
}

class SearchCharacterList: SearchCharacterListType {
    
    private let repository: SearchCharacterListRepositoryType
    
    init(repository: SearchCharacterListRepositoryType) {
        self.repository = repository
    }
    
    func execute(characterName: String) async -> Result<[CharacterItem], HomeDomainError> {
        let characterListResult = await repository.searchCharacter(characterName: characterName)
        
        guard case .success(let characterList) = characterListResult else {
            guard case .failure(let error) = characterListResult else {
                return .failure(.generic)
            }
            return .failure(error)
        }

        return .success(characterList)
    }

}
