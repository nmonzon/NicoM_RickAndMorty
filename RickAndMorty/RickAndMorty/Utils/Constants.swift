//
//  Constants.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 21/4/2024.
//

import Foundation

enum Constants {
    static let baseCharacterUrl = "https://rickandmortyapi.com/api/character/"
    static let secondPageCharacterUrl = "https://rickandmortyapi.com/api/character/?page=2"
    static let baseEpisodeUrl = "https://rickandmortyapi.com/api/episode/"
    static let baseLocationUrl = "https://rickandmortyapi.com/api/location/"
    
    enum appStates: String {
        case loadMoreItems
        case appDidTerminate
        case loadedNextPage
    }
}
