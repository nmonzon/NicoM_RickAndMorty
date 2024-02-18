//
//  Location.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import Foundation

struct LocationItem: Identifiable {
    var id: Int? = nil
    let name: String
    var type: String? = nil
    var dimension: String? = nil
    var characters: [CharacterItem]
    var residents: [String]? = nil
    let url: String
    var created: String? = nil
}
