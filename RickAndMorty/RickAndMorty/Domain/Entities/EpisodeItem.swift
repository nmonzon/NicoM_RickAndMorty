//
//  EpisodeItem.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

struct EpisodeItem: Identifiable, Codable {
    
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [CharacterItem]
    let url: String
    let created: String
}
