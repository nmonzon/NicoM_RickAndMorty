//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 10/2/2024.
//

import SwiftUI
import Kingfisher

struct CharacterDetailView: View {
    
    let characterDetailItem: CharacterItem
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor
                
                ScrollView {
                    GeometryReader { proxy in
                        let global = proxy.frame(in: .global)
                        
                        KFImage.url(URL(string: characterDetailItem.image))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: global.minY > 0 ? UIScreen.main.bounds.width + abs(global.minX) : UIScreen.main.bounds.width, height: global.minY > 0 ? 375 + global.minY : 375)
                            .offset(x: global.minX > 0 ? -global.minX : 0, y: global.minY > 0 ? -global.minY : 0)
                            .ignoresSafeArea(.all)
                    }
                    .frame(height: 375)
                    
                    Text(characterDetailItem.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.titleColor)
                    LazyVGrid(columns: columns, spacing: 10) {
                        
                        ForEach(characterDetailItem.nonEmptyFields(), id: \.self) { field in
                            
                            VStack {
                                Text(field.title)
                                    .fontWeight(.medium)
                                    .frame(width: UIScreen.main.bounds.width / 2, height: 40)
                                    .background(Color.lightBackgroundColor)
                                    .foregroundColor(.titleColor)
                                
                                Text(field.description)
                                    .fontWeight(.regular)
                                    .frame(width: UIScreen.main.bounds.width / 2, height: 40)
                                    .foregroundColor(.subtitleColor)
                            }
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            
                            
                        }
                    }
                    .padding(.horizontal, 8)
                    
                    if !characterDetailItem.episode.isEmpty {
                        Text("Episodes")
                            .fontWeight(.medium)
                            .frame(width: UIScreen.main.bounds.width, height: 40)
                            .background(Color.lightBackgroundColor)
                            .foregroundColor(.titleColor)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                ForEach(characterDetailItem.episode) { episode in
                                    EpisodeView(item: episode)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.bottom, 16)
                    }
                }
                
            }
        }
        
    }
}

//#Preview {
//    CharacterDetailView(characterDetailItem: MockHelper.generateCharacterItem())
//}
