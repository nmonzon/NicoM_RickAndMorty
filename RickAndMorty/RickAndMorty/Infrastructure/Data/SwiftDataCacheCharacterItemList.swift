//
//  SwiftDataCacheCharacterItemList.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 18/2/2024.
//

import Foundation

class SwiftDataCacheCharacterItemList: CacheCharactersInfoDatasourceType {
    
    private let container: SwiftDataContainerType
    
    init(container: SwiftDataContainerType) {
        self.container = container
    }
    
    func getCharacterList() async -> [CharacterItem] {
        
        let characterList = container.fetchCharacters()
        return characterList.map { CharacterItem(
            id: $0.id,
            name: $0.name,
            status: $0.status,
            species: $0.species,
            type: $0.type,
            gender: $0.gender,
            origin: $0.origin,
            location: $0.location,
            image: $0.image,
            episode: $0.episode,
            url: $0.url,
            created: $0.created
        )}
    }
    
    func saveCharacterList(_ characterList: [CharacterItem]) async {
        let characterListData = characterList.map { CharacterItemData(
            id: $0.id,
            name: $0.name,
            status: $0.status,
            species: $0.species,
            type: $0.type,
            gender: $0.gender,
            origin: $0.origin,
            location: $0.location,
            image: $0.image,
            episode: $0.episode,
            url: $0.url,
            created: $0.created)
        }
        await container.insert(characterListData)
    }
    
    
}
