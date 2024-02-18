//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import SwiftUI

struct ContentView: View {
    
    let characterListView: CharacterListView
    let locationListView: LocationListView
    let episodeListView: EpisodeListView
    
    var body: some View {
        TabView {
            characterListView.tabItem {
                Label("Characters", systemImage: "figure")
            }
            episodeListView.tabItem {
                Label("Episodes", systemImage: "tv")
            }
            locationListView.tabItem {
                Label("Locations", systemImage: "location.circle")
            }
        }
    }
}

