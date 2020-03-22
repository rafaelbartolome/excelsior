//
//  ScreenMock.swift
//  NavigatorKitTests
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import UIKit
import NavigatorKit

class ScreenMock: Screen {
    var viewControllerCalls: [ScreenParams] = []
    var stubViewController: UIViewController?
    func viewController(with params: ScreenParams?) -> UIViewController {
        viewControllerCalls.append( params ?? [:])
        return stubViewController ?? UIViewController()
    }
}
