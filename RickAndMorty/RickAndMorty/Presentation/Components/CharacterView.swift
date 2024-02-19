//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 18/2/2024.
//

import SwiftUI
import Kingfisher

struct CharacterView: View {
    
    var item: CharacterItem
    
    var body: some View {
        HStack {
            KFImage(URL(string: item.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.height/8, height: UIScreen.main.bounds.height/8)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            
            VStack(alignment: .leading) {
                Spacer()
                Text(item.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.titleColor)
                    //.lineLimit(nil)
                Text(item.species)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.subtitleColor)
                Spacer()
            }
            
            Spacer()
        }
        .frame(height: UIScreen.main.bounds.height / 8)
        .padding(8)
        .background(LinearGradient(gradient: Gradient(colors: [.lightBackgroundColor, .backgroundColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

//#Preview {
//    CharacterView(item: MockHelper.generateCharacterItem())
//}
