//
//  Equatable.swift
//  RickAndMortyTests
//
//  Created by Nicolas Monzon on 18/2/2024.
//

import Foundation

extension CharacterItem: Equatable {
    static func == (lhs: CharacterItem, rhs: CharacterItem) -> Bool {
        return lhs.id == rhs.id
        && lhs.name == rhs.name
        && lhs.gender == rhs.gender
        && lhs.image == rhs.image
        && lhs.created == rhs.created
        && lhs.status == rhs.status
        && lhs.url == rhs.url
        && lhs.type == rhs.type
    }
}
