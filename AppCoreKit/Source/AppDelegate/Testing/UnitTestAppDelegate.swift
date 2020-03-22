//
//  UnitTestAppDelegate.swift
//  AppCoreKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

#if DEBUG

import Foundation
import UIKit

/// App delegate to be used during unit tests, in ordeer not to lauch the app
public class UnitTestAppDelegate: UIResponder, UIApplicationDelegate {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        return true
    }
}

#endif
