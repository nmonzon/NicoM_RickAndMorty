//
//  EpisodeListView.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import SwiftUI

struct EpisodeListView: View {
    
    @ObservedObject private var viewModel: EpisodeListViewModel
    
    init(viewModel: EpisodeListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor.ignoresSafeArea(.all)
                
                ScrollView {
                    ForEach(viewModel.items) { item in
                        NavigationLink {
                            DetailView(detailItem: DetailItem(title: "Episode Detail",
                                                              dictInfo: [
                                                                "Air Date:": item.air_date,
                                                                "Name:": item.name,
                                                                "Episode:": item.episode
                                                              ],
                                                              characterImages: item.characters.map({$0.image})))
                        } label: {
                            EpisodeView(item: item)
                        }
                        
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Episodes")
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}
