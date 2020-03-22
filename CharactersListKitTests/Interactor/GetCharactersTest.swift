//
//  GetCharactersTest.swift
//  CharactersListKitTests
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import XCTest
@testable import CharactersListKit
@testable import DataProviders
import ToolsKit

class GetCharactersTest: XCTestCase {
    
    var sut: GetCharacters!

    let characterRepositoryMock =  CharacterRepositoryMock()
    let fullySynchronousSchedulerFactory = FullySynchronousSchedulerFactory()
    
    override func setUp() {
        sut = GetCharacters(characterRepository: characterRepositoryMock,
                            schedulerFactory: fullySynchronousSchedulerFactory)
    }
}

extension GetCharactersTest {
    func test_execute_callsRepo() {
        // given
        let anyLetter = "aaa"
        let anyOffset = 3
        
        // when
        sut.execute(nameStartsWith: anyLetter,
                    offset: anyOffset) { _ in }
        
        // then
        let params = characterRepositoryMock.charactersCalls.first
        XCTAssertEqual(anyLetter, params?.0)
        XCTAssertEqual(anyOffset, params?.1)
    }
    
    func test_repoSucces_execute_returnsData() {
        // given
        let anyLetter = "aaa"
        let anyOffset = 3
        let anyCharacter = Character(id: 1,
                                     name: "Spiderman",
                                     bio: "The amazing one",
                                     thumbnailURL: nil,
                                     modified: Date())
        let anyCharacterListModel = CharacterListModel(with: anyCharacter)
        
        // when
        var resultData: [CharacterListModel]?
        sut.execute(nameStartsWith: anyLetter,
                    offset: anyOffset) { result in
                        switch result {
                        case .success(let data):
                            resultData = data
                        default:
                            XCTFail("Operation must fail")
                        }
        }
        
        // then
        let params = characterRepositoryMock.charactersCalls.first
        let completion = params?.2
        completion?(.success([anyCharacter]))
                            
        XCTAssertEqual([anyCharacterListModel], resultData)
    }
    
    func test_repoError_execute_returnsError() {
        // given
        let anyLetter = "aaa"
        let anyOffset = 3
        
        // when
        var resultError: CharacterListError?
        sut.execute(nameStartsWith: anyLetter,
                    offset: anyOffset) { result in
                        switch result {
                        case .failure(let error):
                            resultError = error
                        default:
                            XCTFail("Operation must fail")
                        }
        }
        
        // then
        let params = characterRepositoryMock.charactersCalls.first
        let completion = params?.2
        completion?(.failure(CharacterRepositoryError.notFound))
        
        XCTAssertEqual(CharacterListError.notFound, resultError)
    }
}
