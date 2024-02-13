//
//  EpisodeListViewModel.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import SwiftUI

class EpisodeListViewModel: ObservableObject {
    
    @Published var showLoadingSpinner: Bool = false
    @Published var items: [EpisodeItem] = []
    private let getEpisodesList: GetEpisodeListType
    
    init(getEpisodesList: GetEpisodeListType) {
        self.getEpisodesList = getEpisodesList
    }
    
    func onAppear() {
        showLoadingSpinner = true
        Task {
            
            let episodeListResult = await getEpisodesList.execute()
            
            Task { @MainActor in
                showLoadingSpinner = false
                guard case .success(let episodeList) = episodeListResult else {
                    return
                }
                self.items = episodeList
            }
        }
    }
}
