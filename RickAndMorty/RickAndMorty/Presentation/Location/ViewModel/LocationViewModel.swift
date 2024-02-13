//
//  LocationListViewModel.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import SwiftUI

class LocationListViewModel: ObservableObject {
    
    @Published var showLoadingSpinner: Bool = false
    @Published var items: [LocationItem] = []
    private let getLocationsList: GetLocationListType
    
    init(getLocationsList: GetLocationListType) {
        self.getLocationsList = getLocationsList
    }
    
    func onAppear() {
        showLoadingSpinner = true
        Task {
            
            let locationListResult = await getLocationsList.execute()
            
            Task { @MainActor in
                showLoadingSpinner = false
                guard case .success(let locationList) = locationListResult else {
                    return
                }
                self.items = locationList
            }
        }
    }
}

