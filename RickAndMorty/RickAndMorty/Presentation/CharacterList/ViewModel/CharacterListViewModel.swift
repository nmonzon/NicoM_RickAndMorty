//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import SwiftUI

class CharacterListViewModel: ObservableObject {
    
    @Published var showLoadingSpinner: Bool = false
    @Published var items: [CharacterItem] = []
    private let getCharactersList: GetCharactersListType
    private let searchCharacterList: SearchCharacterListType
    
    init(getCharactersList: GetCharactersListType, searchCharacterList: SearchCharacterListType) {
        self.getCharactersList = getCharactersList
        self.searchCharacterList = searchCharacterList
    }
    
    func onAppear() {
        showLoadingSpinner = true
        Task {
            let characterListResult = await getCharactersList.execute()
            handleResult(characterListResult)
        }
    }
    
    func search(characterName: String) {
        Task {
            let characterListResult = await searchCharacterList.execute(characterName: characterName)
            handleResult(characterListResult)
        }
    }
    
    private func handleResult(_ result: Result<[CharacterItem],HomeDomainError>) {
        Task { @MainActor in
            showLoadingSpinner = false
            guard case .success(let characterList) = result else {
                return
            }
            self.items = characterList
        }
    }
}
