//
//  EpisodeDTO.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

// MARK: - Episode
struct EpisodesDTO: Codable {
    let info: InfoDTO
    let results: [EpisodeDTO]
}

// MARK: - Result
struct EpisodeDTO: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
