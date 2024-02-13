//
//  GetCharactersListType.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

class GetCharactersListRepository: GetCharacterListRepositoryType {
    
    private let characterListDatasource: CharacterListDatasourceType
    private let charactersDomainMapper: CharactersDomainMapper
    private let characterDomainErrorMapper: CharacterErrorDomainMapper
    
    init(
        characterListDatasource: CharacterListDatasourceType,
        charactersDomainMapper: CharactersDomainMapper,
        characterErrorDomainMapper: CharacterErrorDomainMapper
        
    ) {
        self.characterListDatasource = characterListDatasource
        self.charactersDomainMapper = charactersDomainMapper
        self.characterDomainErrorMapper = characterErrorDomainMapper
    }
    
    func getCharacterList() async -> Result<[CharacterItem], HomeDomainError> {
        
        let characterListResult = await characterListDatasource.getCharacterList()
        guard case .success(let characterList) = characterListResult else {
            guard case .failure(let error) = characterListResult else {
                return .failure(.generic)
            }
            return .failure(characterDomainErrorMapper.map(error: error))
        }

        return .success(charactersDomainMapper.toDomain(characters: characterList))
    }
    
}
