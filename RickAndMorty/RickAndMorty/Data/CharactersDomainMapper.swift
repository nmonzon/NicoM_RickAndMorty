//
//  CharactersDomainMapper.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

struct CharactersDomainMapper {
    
    func findCharactersWithEpisodes(for characters: [CharacterDTO], episodes: [EpisodeDTO]) -> [CharacterItem] {
        var characterItems: [CharacterItem] = []
        
        for character in characters {
            // Extraer los IDs de episodios para este personaje
            let episodeIDs = character.episode.compactMap { extractEpisodeID(from: $0) }
            
            // Filtrar los episodios correspondientes a estos IDs
            let matchingEpisodes = episodes.filter { episodeIDs.contains($0.id) }
            
            // Construir objetos EpisodeItem para los episodios encontrados
            let episodeItems = matchingEpisodes.map { EpisodeItem(id: $0.id, name: $0.name, air_date: $0.airDate, episode: $0.episode, characters: [], url: $0.url, created: $0.created) }
            
            // Construir CharacterItem con los episodios encontrados
            let characterItem = CharacterItem(id: character.id,
                                               name: character.name,
                                               status: character.status,
                                               species: character.species,
                                               type: character.type,
                                               gender: character.gender,
                                              origin: CharacterOrigin(name: character.origin.name, url: character.origin.url),
                                              location: CharacterLocation(name: character.name, url: character.url),
                                               image: character.image,
                                               episode: episodeItems,
                                               url: character.url,
                                               created: character.created)
            
            // Agregar el CharacterItem al array resultante
            characterItems.append(characterItem)
        }
        
        return characterItems
    }
    
    private func extractEpisodeID(from urlString: String) -> Int? {
        // Extraer el ID del URL del episodio
        let components = urlString.components(separatedBy: "/")
        guard let idString = components.last, let id = Int(idString) else {
            return nil
        }
        return id
    }
    
}
