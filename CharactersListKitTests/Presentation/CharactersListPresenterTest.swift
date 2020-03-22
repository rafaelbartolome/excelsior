//
//  CharactersListPresenterTest.swift
//  CharactersListKitTests
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import XCTest
@testable import CharactersListKit

class CharactersListPresenterTest: XCTestCase {

    var sut: CharactersListPresenter!
    
    let characterDetailNavigatorMock = CharacterDetailNavigatorMock()
    let charactersListPresenterDelegateMock = CharactersListPresenterDelegateMock()
    override func setUp() {
        sut =  CharactersListPresenter(characters: CharacterMother.anyCharacters,
                                       navigator: characterDetailNavigatorMock)
        sut.delegate = charactersListPresenterDelegateMock
    }
}

extension CharactersListPresenterTest {
    func test_numberOfCharacters_returnsRight() {
        //when
        let result = sut.numberOfCharacters
        
        // then
        XCTAssertEqual(result, CharacterMother.anyCharacters.count)
    }
    
    func test_characterForIndex_returnsRight() {
        // given
        let index = 1
        //when
        let result = sut.character(for: index)
        
        // then
        XCTAssertEqual(result, CharacterMother.anyCharacters[index])
    }
    
    func test_characterSelected_navigatesToDetailWithCharacterId() {
        // given
        let index = 1
        //when
        sut.characterSelected(at: index)
        
        // then
        XCTAssertEqual(CharacterMother.anyCharacters[index].id,
                       characterDetailNavigatorMock.navigateToCharacterDetailCalls.first)
    }
    
    func test_askedForLastCharacter_askForMore() {
        // given
        let index = CharacterMother.anyCharacters.count - 1
        
        //when
        _ = sut.character(for: index)
        
        // then
        XCTAssertEqual(1, charactersListPresenterDelegateMock.loadMoreCalls)
    }
}
