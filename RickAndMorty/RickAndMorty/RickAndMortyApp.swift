//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                characterListView: CharactersFactory.create(),
                locationListView: LocationsFactory.create(),
                episodeListView: EpisodesFactory.create())
        }
    }
}
