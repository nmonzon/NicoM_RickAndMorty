//
//  LocationListView.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import SwiftUI

struct LocationListView: View {
    
    @ObservedObject private var viewModel: LocationListViewModel
    
    init(viewModel: LocationListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor.ignoresSafeArea(.all)
                ScrollView {
                    ForEach(viewModel.items) { item in
                        NavigationLink {
                            DetailView(detailItem: DetailItem(title: "Location Detail",
                                                              dictInfo: [
                                                                "Dimension:": item.dimension ?? "",
                                                                "Name:": item.name,
                                                                "Type:": item.type ?? ""
                                                              ],
                                                              characterImages: item.characters.map({$0.image})))
                        } label: {
                            LocationView(item: item)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            .navigationTitle("Locations")
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}
