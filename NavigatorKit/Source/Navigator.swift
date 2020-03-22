//
//  Navigator.swift
//  NavigatorKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import UIKit

public protocol Navigator {
    func handle(navigation: Navigation, animated: Bool)
}

public extension Navigator {
    func handle(navigation: Navigation) {
        handle(navigation: navigation, animated: true)
    }
}

final class InternalNavigator: Navigator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func handle(navigation: Navigation, animated: Bool = true) {
        switch navigation {
        case let .root(screen, params):
            setRootScreen(screen, with: params)
        
//        case .section(let section):
//            tabBarController().selectedIndex = section.rawValue
//
//        case .modal(let screen):
//            topMostViewController().present(
//                screen.viewController(),
//                animated: animated
//            )
//
//        case .push(let screen):
//            currentNavigationController().pushViewController(
//                screen.viewController(),
//                animated: animated
//            )
//        }
        default:
            #warning("TODO: WIP implement navigation modes")
            print("TODO")
        }
    }
    
}

private extension InternalNavigator {
    func setRootScreen(_ screen: Screen, with params: ScreenParams?) {
        let viewController = screen.viewController(with: params)
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
