//
//  CharacterDetailItem.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

struct CharacterDetailItem: Identifiable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
//    let location:Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
}
