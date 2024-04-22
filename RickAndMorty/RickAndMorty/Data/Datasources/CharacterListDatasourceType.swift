//
//  CharacterListDatasourceType.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import Foundation

protocol CharacterListDatasourceType {
    func getCharacterList() async -> Result<[CharacterDTO],HTTPClientError>
    func getCharacterList(characterName:String) async -> Result<[CharacterDTO],HTTPClientError>
}
