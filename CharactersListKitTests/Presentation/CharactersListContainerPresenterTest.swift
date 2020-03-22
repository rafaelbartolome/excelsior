//
//  CharactersListContainerPresenterTest.swift
//  CharactersListKitTests
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

@testable import CharactersListKit
import XCTest

class CharactersListContainerPresenterTest: XCTestCase {

    var sut: CharactersListContainerPresenter!
    
    // Dependencies
    let getCharactersMock = GetCharactersMock()
    let viewMock = CharactersListContainerViewMock()
    
    override func setUp() {
        super.setUp()
        
        sut = CharactersListContainerPresenter(getCharacters: getCharactersMock)
        sut.view = viewMock
    }
}

extension CharactersListContainerPresenterTest {
    func test_didLoad_viewSetsToLoading() {
        // when
        sut.didLoad()
        
        // then
        XCTAssertEqual(.loading("Loading characters list ..."), viewMock.showViewCalls.first)
    }
    
    func test_didLoad_getCharacters() {
        // when
        sut.didLoad()
        
        // then
        XCTAssertEqual(getCharactersMock.executeCalls.count, 1)
    }
    
    func test_retryViewDidTapOnButton_getCharacters() {
        // when
        sut.retryViewDidTapOnButton()
        
        // then
        XCTAssertEqual(.loading("Loading characters list ..."), viewMock.showViewCalls.first)
        XCTAssertEqual(getCharactersMock.executeCalls.count, 1)
    }
    
    func test_loadMore_getCharacters() {
        // when
        sut.loadMore()
        
        // then
        XCTAssertEqual(getCharactersMock.executeCalls.count, 1)
    }
    
    func test_loadCharactersListWithFailure_showError() {
        // when
        sut.didLoad()
        let completion = getCharactersMock.executeCalls.first!.2
        completion(.failure(.notFound))

        // then
        XCTAssertEqual(.loadError(title: "",
                                  description: "",
                                  delegate: sut), viewMock.showViewCalls.last)
    }
    
    func test_loadCharactersListWithSuccess_showCharacters() {
        // when
        sut.didLoad()
        let completion = getCharactersMock.executeCalls.first!.2
        completion(.success([]))
        
        // then
        XCTAssertEqual(.charactersList([],
                                       offset: 0 ,
                                       delegate: sut), viewMock.showViewCalls.last)
    }
}
