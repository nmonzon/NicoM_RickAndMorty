//
//  SearchCharacterListTests.swift
//  RickAndMortyTests
//
//  Created by Nicolas Monzon on 18/2/2024.
//

import XCTest
@testable import RickAndMorty

class SearchCharacterListRepositoryStub: SearchCharacterListRepositoryType {
    
    private let result: Result<[CharacterItem], HomeDomainError>
    
    init(result: Result<[CharacterItem], HomeDomainError>) {
        self.result = result
    }
    
    func searchCharacter(characterName: String) async -> Result<[CharacterItem], HomeDomainError> {
        return result
    }
    
}

extension CharacterItem: Equatable {
    static func == (lhs: CharacterItem, rhs: CharacterItem) -> Bool {
        return lhs.id == rhs.id
        && lhs.name == rhs.name
        && lhs.gender == rhs.gender
        && lhs.image == rhs.image
        && lhs.created == rhs.created
        && lhs.status == rhs.status
        && lhs.url == rhs.url
        && lhs.type == rhs.type
    }
}

final class SearchCharacterListTests: XCTestCase {

    func test_execute_returns_all_characters_array_when_repository_returns_empty_array() async {
        /*
        //GIVEN
        let mockArray = [
            CharacterItem(
                            id: 1,
                            name: "Rick Sanchez",
                            status: "Alive",
                            species: "Human",
                            type: "",
                            gender: "Male",
                            origin: CharacterOrigin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                            location: CharacterLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
                            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                            episode: [EpisodeItem(id: 1, name: "Pilot", air_date: "December 2, 2013", episode: "S01E01", characters: [], url: "https://rickandmortyapi.com/api/episode/1", created: "2017-11-10T12:56:33.798Z")],
                            url: "https://rickandmortyapi.com/api/character/1",
                            created: "2017-11-04T18:48:46.250Z"
                        ),
            CharacterItem(
                            id: 2,
                            name: "Morty Smith",
                            status: "Alive",
                            species: "Human",
                            type: "",
                            gender: "Male",
                            origin: CharacterOrigin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                            location: CharacterLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
                            image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                            episode: [EpisodeItem(id: 1, name: "Pilot", air_date: "December 2, 2013", episode: "S01E01", characters: [], url: "https://rickandmortyapi.com/api/episode/1", created: "2017-11-10T12:56:33.798Z")],
                            url: "https://rickandmortyapi.com/api/character/2",
                            created: "2017-11-04T18:48:46.250Z"
                        ),
            CharacterItem(
                            id: 3,
                            name: "Summer Smith",
                            status: "Alive",
                            species: "Human",
                            type: "",
                            gender: "Female",
                            origin: CharacterOrigin(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"),
                            location: CharacterLocation(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"),
                            image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg",
                            episode: [EpisodeItem(id: 1, name: "Pilot", air_date: "December 2, 2013", episode: "S01E01", characters: [], url: "https://rickandmortyapi.com/api/episode/1", created: "2017-11-10T12:56:33.798Z")],
                            url: "https://rickandmortyapi.com/api/character/3",
                            created: "2017-11-04T18:48:46.250Z"
                        ),
            CharacterItem(
                            id: 4,
                            name: "Jerry Smith",
                            status: "Death",
                            species: "Human",
                            type: "",
                            gender: "Male",
                            origin: CharacterOrigin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                            location: CharacterLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
                            image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg",
                            episode: [EpisodeItem(id: 1, name: "Pilot", air_date: "December 2, 2013", episode: "S01E01", characters: [], url: "https://rickandmortyapi.com/api/episode/1", created: "2017-11-10T12:56:33.798Z")],
                            url: "https://rickandmortyapi.com/api/character/4",
                            created: "2017-11-04T18:48:46.250Z"
                        ),
            CharacterItem(
                            id: 5,
                            name: "Beth Smith",
                            status: "Alive",
                            species: "Human",
                            type: "",
                            gender: "Female",
                            origin: CharacterOrigin(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                            location: CharacterLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
                            image: "https://rickandmortyapi.com/api/character/avatar/5.jpeg",
                            episode: [EpisodeItem(id: 1, name: "Pilot", air_date: "December 2, 2013", episode: "S01E01", characters: [], url: "https://rickandmortyapi.com/api/episode/1", created: "2017-11-10T12:56:33.798Z")],
                            url: "https://rickandmortyapi.com/api/character/5",
                            created: "2017-11-04T18:48:46.250Z"
            )
        ]
        
        let result: Result<[CharacterItem], HomeDomainError> = .success(mockArray)
        let stub = SearchCharacterListRepositoryStub(result: result)
        let sut = SearchCharacterList(repository: stub)
        
        //WHEN
        let capturedResult = await sut.execute(characterName: "Summer Smith")
        
        //THEN
        do {
            let capturedCharactedList = try XCTUnwrap(capturedResult.get())
            XCTAssertEqual(capturedCharactedList[0], mockArray[0])
            XCTAssertEqual(capturedCharactedList[1], mockArray[1])
            XCTAssertEqual(capturedCharactedList[2], mockArray[2])
            XCTAssertEqual(capturedCharactedList[3], mockArray[3])
            XCTAssertEqual(capturedCharactedList[4], mockArray[4])
        } catch {
            XCTFail("Error unwrapping captured result: \(error)")
        }
         */
    }

}

