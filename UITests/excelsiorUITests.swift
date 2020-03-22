//
//  excelsiorUITests.swift
//  excelsiorUITests
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import XCTest


/// Just a couple of simple test here.
/// I didn't have time to prepare a MarvelAPI stub that should returns valid data for those test instead of calling the real API
/// Those are more integration test, but they are quite fragile as depend of external data out of out control and also timeouts due to
/// the network dependency.


class excelsiorUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }
  
    func test_givenALoadedList_tappingInACell_detailIsPresented() {
        // given
        let app = XCUIApplication()
        app.launch()
        _ = app.navigationBars["Character list"].waitForExistence(timeout: 5)
        
        // when
        let tablesQuery = app.tables
        let cell = tablesQuery.cells.containing(.staticText, identifier:"A.I.M.").element
        _ = cell.waitForExistence(timeout: 5)
        cell.tap()
        
        // then
        let element = app.navigationBars["Character Detail"]
        XCTAssert(element.waitForExistence(timeout: 5))
    }
    
    func test_givenACharacterDetail_tappingBack_listIsPresented() {
        // given
        let app = XCUIApplication()
        app.launch()
        let tablesQuery = app.tables
        let cell = tablesQuery.cells.containing(.staticText, identifier:"A.I.M.").element
        _ = cell.waitForExistence(timeout: 5)
        cell.tap()
        
        // when
        let characterListButton = app.navigationBars["Character Detail"].buttons["Character list"]
        _ = characterListButton.waitForExistence(timeout: 5)
        characterListButton.tap()
        
        // then
        let element = app.navigationBars["Character list"]
        XCTAssert(element.waitForExistence(timeout: 5))
    }
}
