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
    
    init(getCharactersList: GetCharactersListType) {
        self.getCharactersList = getCharactersList
    }
    
    func onAppear() {
        showLoadingSpinner = true
        Task {
            
            let characterListResult = await getCharactersList.execute()
            
            Task { @MainActor in
                showLoadingSpinner = false
                guard case .success(let characterList) = characterListResult else {
                    return
                }
                self.items = characterList
            }
        }
    }
}
