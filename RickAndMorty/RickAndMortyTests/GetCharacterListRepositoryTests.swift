//
//  GetCharacterListRepositoryTests.swift
//  RickAndMortyTests
//
//  Created by Nicolas Monzon on 18/2/2024.
//

@testable import RickAndMorty
import XCTest

final class GetCharacterListRepositoryTests: XCTestCase {
    
    func test_getCharacterList_return_characters_from_cache_when_cache_datasource_returns_no_empty_array() async{
        
        //GIVEN
        let mockArray = [
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
        let result: [CharacterItem] = mockArray
        let stub = CacheDatasourceStub(result: mockArray)
        
        let sut = GetCharactersListRepository(
            characterListDatasource: CharacterListDatasource(httpClient: HTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver())),
            charactersDomainMapper: CharactersDomainMapper(),
            characterErrorDomainMapper: CharacterErrorDomainMapper(),
            cacheDatasource: stub,
            episodeListDatasource: EpisodeListDatasource(httpClient: HTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver()))
        )
        
        // WHEN
        let capturedResult = await sut.getCharacterList()
        
        //THEN
        do {
            let capturedCharactedList = try XCTUnwrap(capturedResult.get())
            
            XCTAssertEqual(capturedCharactedList[0], mockArray[0])
        } catch  {
            
        }
    }
    
    func test_getCharacterList_return_success_when_cache_datasource_returns_no_empty_array() async{
        //GIVEN
        let mockArray = [
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
        let result: Result<[CharacterItem], HomeDomainError> = .success(mockArray)
        let stub = CacheDatasourceStub(result: mockArray)
        
        let sut = GetCharactersListRepository(
            characterListDatasource: CharacterListDatasource(httpClient: HTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver())),
            charactersDomainMapper: CharactersDomainMapper(),
            characterErrorDomainMapper: CharacterErrorDomainMapper(),
            cacheDatasource: stub,
            episodeListDatasource: EpisodeListDatasource(httpClient: HTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver()))
        )
        
        // WHEN
        let capturedResult = await sut.getCharacterList()
        
        //THEN
        XCTAssertEqual(capturedResult, result)
    }
    
}
