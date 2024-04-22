////
////  SearchCharacterListTests.swift
////  RickAndMortyTests
////
////  Created by Nicolas Monzon on 18/2/2024.
////


@testable import RickAndMorty
import XCTest

final class SearchCharacterListTests: XCTestCase {

    func test_execute_returns_error_when_repositoy_returns_error() async {
        
        //GIVEN
        let result: Result<[CharacterItem], HomeDomainError> = .failure(.generic)
        let stub = SearchCharacterListRepositoryStub(result: result)
        let sut = SearchCharacterList(repository: stub)
        
        //WHEN
        let capturedResult = await sut.execute(characterName: "")
        
        //THEN
        XCTAssertEqual(capturedResult, result)
         
    }
    
    func test_execute_returns_success_when_repositoy_returns_success() async {
        
        //GIVEN
        let mockData = [
            CharacterItem(
                id: 1,
                name: "Rick Sanchez",
                status: "Alive",
                species: "Human",
                type: "",
                gender: "Male",
                origin: CharacterOrigin(name: "Earth (C-137)", url: "https://rickandmortyapi.co   m/api/location/1"),
                location: CharacterLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
                image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                episode: [EpisodeItem(id: 1, name: "Pilot", air_date: "December 2, 2013", episode: "S01E01", characters: [], url: "https://rickandmortyapi.com/api/episode/1", created: "2017-11-10T12:56:33.798Z")], url: "https://rickandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z")
        ]
        
        let result: Result<[CharacterItem], HomeDomainError> = .success(mockData)
        let stub = SearchCharacterListRepositoryStub(result: result)
        let sut = SearchCharacterList(repository: stub)
        
        //WHEN
        let capturedResult = await sut.execute(characterName: "")
        
        //THEN
        XCTAssertEqual(capturedResult, result)
         
    }

}
