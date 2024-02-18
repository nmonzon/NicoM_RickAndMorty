//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 13/2/2024.
//

import SwiftUI

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .episodes:
            NavigationStack {
                EpisodesFactory.create()
            }
        case .homeMenu:
            NavigationStack {
                HomeMenuFactory.create()
            }
        case .characters:
            NavigationStack {
                CharactersFactory.create()
            }
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .characters:
            NavigationStack {
                CharactersFactory.create()
            }
            
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .characters:
            NavigationStack {
                CharactersFactory.create()
            }
        }
    }
}

enum Page: String, Identifiable {
    case episodes, homeMenu, characters
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case characters
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable {
    case characters
    
    var id: String {
        self.rawValue
    }
}
