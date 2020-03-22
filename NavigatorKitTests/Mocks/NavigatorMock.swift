//
//  NavigatorMock.swift
//  NavigatorKitTests
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import NavigatorKit

class NavigatorMock: Navigator {
    var handleCalls: [Navigation] = []
    func handle(navigation: Navigation, animated: Bool) {
        handleCalls.append(navigation)
    }
}
