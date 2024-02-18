//
//  HomeMenuView.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import SwiftUI

struct HomeMenuView: View {
    
    @ObservedObject private var viewModel: HomeMenuViewModel
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    init(viewModel: HomeMenuViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor.ignoresSafeArea(.all)
                VStack {
                    if viewModel.showLoadingSpinner {
                        ProgressView().progressViewStyle(.circular)
                    } else {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(viewModel.homeList, id: \.self) { homeItem in
                                NavigationLink(
                                    destination: DestinationView(selectedItem: homeItem),
                                    label: {
                                        HomeImageItemView(
                                            title: homeItem.title.capitalized,
                                            imageName: homeItem.title.lowercased())
                                    }
                                )
                            }
                        }
                    }
                    Spacer()
                    
                }
            }
            .navigationTitle("Rick and Morty")
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

struct DestinationView: View {
    let selectedItem: HomeMenuItem
    
    var body: some View {
        if selectedItem.title == "characters" {
            CharactersFactory.create()
        } else if selectedItem.title == "locations" {
            LocationsFactory.create()
        } else {
            EpisodesFactory.create()
        }
    }
}
