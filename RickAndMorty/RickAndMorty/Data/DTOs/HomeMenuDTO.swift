//
//  HomeData.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

struct HomeMenuDTO: Codable, PropertyIterator {
    let characters: String
    let locations: String
    let episodes: String
}

extension HomeMenuDTO {
    func toDomain() -> [HomeMenuItem] {
        return self.dictionaryProperties().map { dictionary in
            let title = dictionary.key
            let url: String = (dictionary.value as? String) ?? ""
            return HomeMenuItem(title: title, url: url)
        }
    }
}
