//
//  AppLaunchCoordinatorTests.swift
//  AppCoreKitTests
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import XCTest
import NavigatorKit
@testable import AppCoreKit

class AppLaunchCoordinatorTests: XCTestCase {
    
    var sut: AppLaunchCoordinator!
    
    let navigatorMock = NavigatorMock()
    let screenMock = ScreenMock()

    override func setUp() {
        sut = AppLaunchCoordinator(mainNavigator: navigatorMock,
                                   firstScreen: screenMock)
    }
}

extension AppLaunchCoordinatorTests {
    func test_givenAppLaunchCoordinator_applicationDidFinishLaunchingWithOptions_setUpMainScreen() {
        // when
        sut.application(didFinishLaunchingWithOptions: nil)

        //then
        XCTAssertEqual(navigatorMock.handleCalls.count, 1)
    }
}
