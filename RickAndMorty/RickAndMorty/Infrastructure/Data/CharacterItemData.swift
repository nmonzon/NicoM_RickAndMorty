//
//  CharacterItemData.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 18/2/2024.
//

import SwiftData
import Foundation

@Model
class CharacterItemData: Hashable {
        
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterOrigin
    let location:CharacterLocation
    let image: String
    let episode: [EpisodeItem]
    let url: String
    let created: String
    
    init(id: Int, name: String, status: String, species: String, type: String, gender: String, origin: CharacterOrigin, location: CharacterLocation, image: String, episode: [EpisodeItem], url: String, created: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}
