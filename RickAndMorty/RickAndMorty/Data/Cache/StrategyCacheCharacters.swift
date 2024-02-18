//
//  StrategyCacheCharacters.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 18/2/2024.
//

import Foundation

class StrategyCacheCharacters: CacheCharactersInfoDatasourceType {
    
    private let temporalCache: CacheCharactersInfoDatasourceType
    private let persistanceCache: CacheCharactersInfoDatasourceType
    
    init(temporalCache: CacheCharactersInfoDatasourceType, persistanceCache: CacheCharactersInfoDatasourceType) {
        self.temporalCache = temporalCache
        self.persistanceCache = persistanceCache
    }
    
    func getCharacterList() async -> [CharacterItem] {
        let temporalCharacterList = await temporalCache.getCharacterList()
        if !temporalCharacterList.isEmpty {
            return temporalCharacterList
        }
        let persistantCharacterList = await persistanceCache.getCharacterList()
        await temporalCache.saveCharacterList(persistantCharacterList)
        return persistantCharacterList
    }
    
    func saveCharacterList(_ characterList: [CharacterItem]) async {
        await temporalCache.saveCharacterList(characterList)
        await persistanceCache.saveCharacterList(characterList)
    }
    
    
}
