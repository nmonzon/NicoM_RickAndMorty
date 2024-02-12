//
//  HomeMenuViewModel.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import Foundation

class HomeMenuViewModel: ObservableObject {
    
    @Published var showLoadingSpinner: Bool = false
    @Published var homeList: [HomeMenuItem] = []
    private let getHomeMenuList: GetHomeMenuListType
    
    init(getHomeMenuList: GetHomeMenuListType) {
        self.getHomeMenuList = getHomeMenuList
    }
    
    func onAppear() {
        showLoadingSpinner = true
        Task {
            let result = await self.getHomeMenuList.execute()
            let homeList = try? result.get()
            
            Task { @MainActor in
                showLoadingSpinner = false
                guard let homeList = homeList else {
                    return
                }
                self.homeList = homeList
            }
        }
    }
}
