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
    private let window: UIWindow
    private var navigationController: UINavigationController!
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func handle(navigation: Navigation, animated: Bool = true) {
        switch navigation {
        case let .root(screen, params):
            setRootScreen(screen, with: params)
        case let .present(screen, params):
            let viewController = screen.viewController(with: params)
            presentationViewController().present(
                viewController,
                animated: animated
            )
        case let .push(screen, params):
            let viewController = screen.viewController(with: params)
            navigationController.pushViewController(
                viewController,
                animated: animated
            )
        }
    }
}

private extension InternalNavigator {
    func setRootScreen(_ screen: Screen, with params: ScreenParams?) {
        let viewController = screen.viewController(with: params)
        navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func presentationViewController() -> UIViewController{
        if let vc = navigationController.visibleViewController {
            return vc
        }
        
        if let vc = navigationController.topViewController {
            return vc
        }
        
        return navigationController.viewControllers.last!
    }
}
