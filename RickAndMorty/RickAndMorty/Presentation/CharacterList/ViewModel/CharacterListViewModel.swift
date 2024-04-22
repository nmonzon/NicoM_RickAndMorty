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
    @Published var filteredItems: [CharacterItem] = []
    @Published var storedItems: [CharacterItem] = []
    private let getCharactersList: GetCharactersListType
    private let searchCharacterList: SearchCharacterListType
    
    init(getCharactersList: GetCharactersListType, searchCharacterList: SearchCharacterListType) {
        self.getCharactersList = getCharactersList
        self.searchCharacterList = searchCharacterList
    }
    
    func onAppear() {
        
        if UserDefaults.standard.object(forKey: Constants.appStates.loadedNextPage.rawValue) == nil {
            UserDefaults.standard.set(Constants.baseCharacterUrl, forKey: Constants.appStates.loadedNextPage.rawValue)
        }
        
        showLoadingSpinner = true
        Task {
            let characterListResult = await getCharactersList.execute()
            handleResult(characterListResult)
        }
    }
    
    func saveAppState() {
        UserDefaults.standard.set(true, forKey: Constants.appStates.appDidTerminate.rawValue)
    }
    
    func search(characterName: String) {
        Task { @MainActor in
            if characterName.isEmpty {
                self.filteredItems = []
                items = storedItems
            } else {
                Task {
                    let characterListResult = await searchCharacterList.execute(characterName: characterName)
                    guard case .success(let characterList) = characterListResult else {
                        return
                    }
                    self.filteredItems = characterList
                    self.items = characterList
                }
            }
        }
    }
    
    func loadMore() {
        Task { @MainActor in
            UserDefaults.standard.setValue(true, forKey: Constants.appStates.loadMoreItems.rawValue)
            let characterListResult = await getCharactersList.execute()
            handleResult(characterListResult)
        }
    }
    
    private func handleResult(_ result: Result<[CharacterItem],HomeDomainError>) {
        if filteredItems.isEmpty {
            Task { @MainActor in
                guard case .success(let characterList) = result else {
                    return
                }
                for character in characterList {
                    self.storedItems.append(character)
                }
                self.items = storedItems
                
                showLoadingSpinner = false
            }
        }
    }
}
