//
//  LocationInfoDTO.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 13/2/2024.
//

import Foundation

// MARK: - Location
struct LocationsInfoDTO: Codable {
    let results: [LocationInfoDTO]
}

// MARK: - Result
struct LocationInfoDTO: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
