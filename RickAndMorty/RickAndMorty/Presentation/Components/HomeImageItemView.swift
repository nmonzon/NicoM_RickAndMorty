//
//  HomeImageItemView.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 12/2/2024.
//

import SwiftUI

struct HomeImageItemView: View {
    
    let title: String
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 180, height: 300)
            .cornerRadius(10)
            .overlay(
                Text(title)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(5)
                    .padding(5),
                alignment: .bottomLeading
            )
    }
}

#Preview {
    HomeImageItemView(title: "Characters", imageName: "characters")
}


