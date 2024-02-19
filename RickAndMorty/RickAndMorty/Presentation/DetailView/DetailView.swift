//
//  LocationDetailView.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 18/2/2024.
//


import SwiftUI
import Kingfisher

struct DetailView: View {
    
    let detailItem: DetailItem
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor.ignoresSafeArea(.all)
                
                ScrollView {
                    
                    ForEach(detailItem.dictInfo.sorted(by: <), id: \.key) { key, value in
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                            Text(key)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.titleColor)
                                .lineLimit(2)
                            
                            Text(value)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.titleColor)
                                .lineLimit(2)
                        }
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .padding()
                        .cornerRadius(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding(.horizontal, 8)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                    
                    if !detailItem.characterImages.isEmpty {
                        Text("Characters of this Episode")
                            .frame(width: UIScreen.main.bounds.width, height: 50)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.titleColor)
                            .background(Color.lightBackgroundColor)
                        
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(detailItem.characterImages, id: \.self) { image in
                                KFImage(URL(string: image))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 180, height: 250)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
            .navigationTitle(detailItem.title)
        }
    }
}


#Preview {
    DetailView(detailItem: MockHelper.getDetailItem())
}
