//
//  Origin.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import Foundation

struct CharacterOrigin: Codable {

    let name: String
    let url: String    
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
