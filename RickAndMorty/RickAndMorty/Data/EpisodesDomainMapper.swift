//
//  EpisodesDomainMapper.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 13/2/2024.
//

import Foundation

struct EpisodesDomainMapper {
    
    func toDomain(episodes: [EpisodeDTO]) -> [EpisodeItem]{
        
        return episodes.map({ EpisodeItem(
            id: $0.id,
            name: $0.name,
            air_date: $0.airDate,
            episode: $0.episode,
            characters: $0.characters,
            url: $0.url,
            created: $0.created
        )})
    }
}
