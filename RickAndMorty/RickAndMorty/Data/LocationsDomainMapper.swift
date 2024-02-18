//
//  LocationsDomainMapper.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

struct LocationsDomainMapper {
    
    func findCharactersWithLocations(for characters: [CharacterDTO], locations: [LocationInfoDTO]) -> [LocationItem] {
        var locationItems: [LocationItem] = []
        
        for location in locations {
            // Extraer los IDs de characters para este location
            let characterIDs = location.residents.compactMap { extractCharacterID(from: $0) }
            
            // Filtrar los characters correspondientes a estos IDs
            let matchingCharacters = characters.filter { characterIDs.contains($0.id) }
            
            // Construir objetos CharacterItem para los characters encontrados
            let characterItems = matchingCharacters.map { CharacterItem(id: $0.id, name: $0.name, status: $0.status, species: $0.species, type: $0.type, gender: $0.gender, origin: CharacterOrigin(name: $0.name, url: $0.url), location: CharacterLocation(name: $0.name, url: $0.url), image: $0.image, episode: [], url: $0.url, created: $0.created) }
            
            // Construir CharacterItem con los episodios encontrados
            let locationItem = LocationItem(id: location.id,
                                            name: location.name,
                                            type: location.type,
                                            dimension: location.dimension,
                                            characters: characterItems,
                                            url: location.url,
                                            created: location.created)
            
            // Agregar el CharacterItem al array resultante
            locationItems.append(locationItem)
        }
        
        return locationItems
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

