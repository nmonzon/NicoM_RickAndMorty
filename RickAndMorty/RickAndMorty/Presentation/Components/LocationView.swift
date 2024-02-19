//
//  LocationView.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 18/2/2024.
//

import SwiftUI

struct LocationView: View {
    
    var item: LocationItem
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            
            VStack() {
                
                Spacer()
                
                Text(item.dimension ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.titleColor)
                    .lineLimit(2)
                
                Text(item.name)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(.subtitleColor)
                    .lineLimit(2)
                
                Text(item.type ?? "")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(.subtitleColor)
            }
        }
        .padding()
        .frame(height: 90)
        .frame(maxWidth: UIScreen.main.bounds.width)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.black, lineWidth: 1)
        )
        .cornerRadius(12)
        .padding(8)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

//#Preview {
//    LocationView(item: MockHelper.generateLocationItem()
//    )
//}
