//
//  MockHelper.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 18/2/2024.
//

import Foundation

struct MockHelper {
    static func getDetailItem() -> DetailItem {
        DetailItem(
            title: "Episode Detail",
            dictInfo: [
            "Name:": "Pilot",
            "Air Date:": "December 2, 2013",
            "Episode": "S01E01"
        ], characterImages: [
            "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            "https://rickandmortyapi.com/api/character/avatar/3.jpeg",
            "https://rickandmortyapi.com/api/character/avatar/4.jpeg",
            "https://rickandmortyapi.com/api/character/avatar/5.jpeg",
            "https://rickandmortyapi.com/api/character/avatar/6.jpeg",
        ])
    }
    
    static func generateCharacterItem() -> CharacterItem {
        CharacterItem(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            origin: CharacterOrigin(name: "Earth (C-137)", url: "https://rickandmortyapi.co   m/api/location/1"),
            location: CharacterLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode: [EpisodeItem(id: 1, name: "Pilot", air_date: "December 2, 2013", episode: "S01E01", characters: [], url: "https://rickandmortyapi.com/api/episode/1", created: "2017-11-10T12:56:33.798Z")], url: "https://rickandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z")
    }
    
    static func generateEpisodeItem() -> EpisodeItem {
        EpisodeItem(
            id: 1,
            name: "Pilot",
            air_date: "December 2, 2013",
            episode: "S01E01",
            characters: [],
            url: "https://rickandmortyapi.com/api/episode/1",
            created: "2017-11-10T12:56:33.798Z"
        )
    }
    
    static func generateLocationItem() -> LocationItem {
        LocationItem(
            id: 1,
            name: "Earth (C-137)",
            type: "Planet",
            dimension: "Dimension C-137",
            characters: [],
            url: "https://rickandmortyapi.com/api/location/1")
    }
}
