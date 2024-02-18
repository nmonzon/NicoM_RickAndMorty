//
//  SwiftDataContainer.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 18/2/2024.
//

import Foundation
import SwiftData

class SwiftDataContainer: SwiftDataContainerType {
    
    static let shared = SwiftDataContainer()
    private let container: ModelContainer
    private let context: ModelContext
    
    private init() {
        let scheme = Schema([CharacterItemData.self])
        container = try! ModelContainer(for: scheme, configurations: [])
        context = ModelContext(container)
    }
    
    func fetchCharacters() -> [CharacterItemData] {
        let descriptor = FetchDescriptor<CharacterItemData>()
        guard let characters = try? context.fetch(descriptor) else {
            return []
        }
        return characters
    }
    
    func insert(_ characterList: [CharacterItemData]) async {
        characterList.forEach( { character in
            context.insert(character)
        })
        try? context.save()
    }
    
    
}
