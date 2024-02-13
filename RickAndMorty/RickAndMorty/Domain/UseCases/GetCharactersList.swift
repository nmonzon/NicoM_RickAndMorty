//
//  GetCharactersList.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

protocol GetCharactersListType {
    func execute() async -> Result<[CharacterItem], HomeDomainError>
}

class GetCharactersList: GetCharactersListType {
    
    private let repository: GetCharacterListRepositoryType
    
    init(repository: GetCharacterListRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<[CharacterItem], HomeDomainError> {
        let characterListResult = await repository.getCharacterList()
        
        guard case .success(let characterList) = characterListResult else {
            guard case .failure(let error) = characterListResult else {
                return .failure(.generic)
            }
            return .failure(error)
        }

        return .success(characterList)
    }
}
