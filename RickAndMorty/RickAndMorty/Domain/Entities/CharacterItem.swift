//
//  Character.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import Foundation

struct CharacterItem: Identifiable, Codable {
    
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
    
//    static func == (lhs: CharacterItem, rhs: CharacterItem) -> Bool {
//        lhs.id == rhs.id
//    }
    
    func nonEmptyFields() -> [Field] {
            let mirror = Mirror(reflecting: self)
            return mirror.children.compactMap { child in
                switch child.label {
                case "id", "name", "episode", "image", "url":
                    return Field(title: "", description: "")
                case "origin":
                    if let value = child.value as? CharacterOrigin {
                        return Field(title: child.label!.capitalized, description: value.name)
                    }
                    return Field(title: "", description: "")
                case "location":
                    if let value = child.value as? CharacterLocation {
                        return Field(title: child.label!.capitalized, description: value.name)
                    }
                    return Field(title: "", description: "")
                case "type":
                    if let value = child.value as? String, !value.isEmpty {
                        return Field(title: child.label!.capitalized, description: value)
                    } else {
                        return Field(title: child.label!.capitalized, description: "None")
                    }
                case "created":
                    if let value = child.value as? String, !value.isEmpty {
                        return Field(title: child.label!.capitalized, description: value.shortFormattedString() ?? value)
                    }
                    return Field(title: "", description: "")
                default:
                    if let value = child.value as? String, !value.isEmpty {
                        return Field(title: child.label!.capitalized, description: value)
                    }
                    return Field(title: "", description: "")
                }
            }
        }
}

struct Field: Hashable {
    let title: String
    let description: String
}
