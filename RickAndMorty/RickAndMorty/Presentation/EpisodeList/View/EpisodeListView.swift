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
                
                Color("backgroundGreen").ignoresSafeArea(.all)
                ScrollView {
                    ForEach(viewModel.items) { item in
                        HStack(spacing: 12) {
//                            KFImage(URL(string: item.image))
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: UIScreen.main.bounds.height/7, height: UIScreen.main.bounds.height/7)
//                                .clipShape(RoundedRectangle(cornerRadius: 12))
//                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Spacer()
                                Text(item.name)
                                    .font(.headline)
                                    .foregroundColor(Color("darkGreen"))
                                    .lineLimit(2)
//                                Text(item.species)
//                                    .font(.subheadline)
//                                    .foregroundColor(Color("green"))
//                                Spacer()
                            }
                            
                            
                            Spacer()
                        }
                        .padding(8)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("lightGreen"), Color("green")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                    .padding(.horizontal)
                }
            }
            
                
            
            .navigationTitle("Characters")
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}
