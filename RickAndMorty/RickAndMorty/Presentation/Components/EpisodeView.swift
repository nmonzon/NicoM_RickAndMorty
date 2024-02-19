//
//  EpisodeView.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 17/2/2024.
//

import SwiftUI

struct EpisodeView: View {
    
    var item: EpisodeItem
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            
            VStack() {
                
                Spacer()
                
                Text(item.episode)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.titleColor)
                    .lineLimit(2)
                
                Text(item.name)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(.subtitleColor)
                    .lineLimit(2)
                
                Text(item.air_date)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.subtitleColor)
            }
        }
        .padding()
        .frame(height: 90)
        .frame(maxWidth: UIScreen.main.bounds.width)
        .background(Color.lightBackgroundColor)
        .cornerRadius(12)
        .padding(8)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    EpisodeView(item: MockHelper.generateEpisodeItem())
}
