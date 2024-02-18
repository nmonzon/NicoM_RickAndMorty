//
//  CacheCharactersInfoDatasourceType.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 17/2/2024.
//

import Foundation

protocol CacheCharactersInfoDatasourceType {
    func getCharacterList() async -> [CharacterItem]
    func saveCharacterList(_ characterList: [CharacterItem]) async
}
