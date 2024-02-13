//
//  Location.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import Foundation

struct LocationItem: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
