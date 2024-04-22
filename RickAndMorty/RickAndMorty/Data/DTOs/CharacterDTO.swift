//
//  CharacterDTO.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

// MARK: - Character
struct CharactersDTO: Decodable {
    let info: InfoDTO
    let results: [CharacterDTO]
}

// MARK: - Result
struct CharacterDTO: Decodable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin: OriginDTO
    let location: LocationDTO
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - LocationDTO
struct OriginDTO: Decodable {
    let name: String
    let url: String
}

// MARK: - LocationDTO
struct LocationDTO: Decodable {
    let name: String
    let url: String
}
