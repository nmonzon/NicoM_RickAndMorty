//
//  SwiftDataContainerType.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 18/2/2024.
//

import Foundation

protocol SwiftDataContainerType {
    func fetchCharacters() -> [CharacterItemData]
    func insert(_ characterList: [CharacterItemData]) async
}
