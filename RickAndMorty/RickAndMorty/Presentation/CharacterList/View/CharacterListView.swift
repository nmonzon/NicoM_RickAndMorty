//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import SwiftUI
import Kingfisher

struct CharacterListView: View {
    
    @ObservedObject private var viewModel: CharacterListViewModel
    @State private var searchCharacter: String = ""
    
    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor.ignoresSafeArea(.all)
                if viewModel.showLoadingSpinner {
                    ProgressView().progressViewStyle(.circular)
                } else {
                    NavigationView {
                        ScrollView {
                            LazyVStack {
                                ForEach(viewModel.items) { item in
                                    
                                    NavigationLink {
                                        CharacterDetailView(characterDetailItem: item)
                                    } label: {
                                        CharacterView(item: item)
                                            
                                    }
                                }
                                if searchCharacter.isEmpty && !viewModel.items.isEmpty {
                                    ProgressView().progressViewStyle(.circular)
                                        .onAppear {
                                            viewModel.loadMore()
                                        }
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                    }
                    .searchable(text: $searchCharacter, placement: .navigationBarDrawer(displayMode: .always))
                    
                    .onChange(of: searchCharacter) { oldValue, searchValue in
                        viewModel.search(characterName: searchValue)
                    }
                }
                
                
            }
            .navigationTitle("Characters")
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}
