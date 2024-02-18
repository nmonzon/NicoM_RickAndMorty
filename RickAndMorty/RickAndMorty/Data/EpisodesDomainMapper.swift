//
//  EpisodesDomainMapper.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 13/2/2024.
//

import Foundation

struct EpisodesDomainMapper {
    
    func findCharactersWithEpisodes(for characters: [CharacterDTO], episodes: [EpisodeDTO]) -> [EpisodeItem] {
        var episodeItems: [EpisodeItem] = []
        
        for episode in episodes {
            // Extraer los IDs de characters para este episodio
            let characterIDs = episode.characters.compactMap { extractCharacterID(from: $0) }
            
            // Filtrar los characters correspondientes a estos IDs
            let matchingCharacters = characters.filter { characterIDs.contains($0.id) }
            
            // Construir objetos CharacterItem para los characters encontrados
            let characterItems = matchingCharacters.map { CharacterItem(id: $0.id, name: $0.name, status: $0.status, species: $0.species, type: $0.type, gender: $0.gender, origin: CharacterOrigin(name: $0.name, url: $0.url), location: CharacterLocation(name: $0.name, url: $0.url), image: $0.image, episode: [], url: $0.url, created: $0.created) }
            
            // Construir CharacterItem con los episodios encontrados
            let episodeItem = EpisodeItem(id: episode.id,
                                          name: episode.name,
                                          air_date: episode.airDate,
                                          episode: episode.episode,
                                          characters: characterItems,
                                          url: episode.url,
                                          created: episode.created)
            
            // Agregar el CharacterItem al array resultante
            episodeItems.append(episodeItem)
        }
        
        return episodeItems
    }
    
    private func extractCharacterID(from urlString: String) -> Int? {
        // Extraer el ID del URL del episodio
        let components = urlString.components(separatedBy: "/")
        guard let idString = components.last, let id = Int(idString) else {
            return nil
        }
        return id
    }
}
