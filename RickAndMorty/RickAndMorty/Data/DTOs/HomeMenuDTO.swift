//
//  HomeData.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

// MARK: - HomeMenuDTO
struct HomeMenuDTO: Codable, PropertyIterator {
    let characters: String
    let locations: String
    let episodes: String
}


