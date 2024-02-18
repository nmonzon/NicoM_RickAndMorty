//
//  InMemoryCacheCharactersInfoDatasource.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 17/2/2024.
//

import Foundation

actor InMemoryCacheCharactersInfoDatasource: CacheCharactersInfoDatasourceType {
    
    static let shared: InMemoryCacheCharactersInfoDatasource = InMemoryCacheCharactersInfoDatasource()
    private var cache: [CharacterItem] = []
    
    private init() {}
    
    func getCharacterList() async -> [CharacterItem] {
        return cache
    }
    
    func saveCharacterList(_ characterList: [CharacterItem]) async{
        self.cache = characterList
    }
    
    
    
}
