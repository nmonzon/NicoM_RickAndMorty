//
//  HomeMenuDomainMapper.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

class HomeMenuDomainMapper: PropertyIterator {
    func toDomain(homeMenuDTO: HomeMenuDTO) -> [HomeMenuItem] {
        return homeMenuDTO.dictionaryProperties().map { dictionary in
            let title = dictionary.key
            let url: String = (dictionary.value as? String) ?? ""
            return HomeMenuItem(title: title, url: url)
        }
    }
}
