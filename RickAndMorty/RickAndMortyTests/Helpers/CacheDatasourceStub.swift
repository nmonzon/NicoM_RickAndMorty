//
//  CacheDatasourceStub.swift
//  RickAndMortyTests
//
//  Created by Nicolas Monzon on 18/2/2024.
//

@testable import RickAndMorty

class CacheDatasourceStub: CacheCharactersInfoDatasourceType {
    
    private let result: [CharacterItem]
    
    init(result: [CharacterItem]) {
        self.result = result
    }
    
    func getCharacterList() async -> [CharacterItem] {
        return result
    }
    
    func saveCharacterList(_ characterList: [CharacterItem]) async {}
}
