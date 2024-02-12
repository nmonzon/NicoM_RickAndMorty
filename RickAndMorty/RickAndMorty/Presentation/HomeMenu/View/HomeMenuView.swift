//
//  HomeMenuView.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import SwiftUI

struct HomeMenuView: View {
    
    @ObservedObject private var viewModel: HomeMenuViewModel
    
    init(viewModel: HomeMenuViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            if viewModel.showLoadingSpinner {
                ProgressView().progressViewStyle(.circular)
            } else {
                Text(viewModel.homeList?.characters ?? "a")
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

