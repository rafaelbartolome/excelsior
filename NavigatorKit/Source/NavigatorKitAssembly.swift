//
//  NavigatorKitAssembly.swift
//  NavigatorKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import UIKit

public final class NavigatorKitAssembly {
    
    private let window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }

    // Creates a brand new navigator
    public func navigator() -> Navigator {
        InternalNavigator(window: window)
    }
}
