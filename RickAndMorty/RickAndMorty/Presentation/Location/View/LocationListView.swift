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
                Color("backgroundGreen").ignoresSafeArea(.all)
                ScrollView {
                    ForEach(viewModel.items) { item in
                        Text(item.name)
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
