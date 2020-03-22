//
//  main.swift
//  excelsior
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import AppCoreKit
import UIKit

let appDelegateClass: AnyClass

#if DEBUG

    public var isRunningUnitTests: Bool {
        guard let unitTestingEnvironmenValue = ProcessInfo.processInfo.environment["UnitTesting"] else {
            return false
        }
        
        return unitTestingEnvironmenValue == "YES"
    }

    if isRunningUnitTests {
        appDelegateClass = UnitTestAppDelegate.self
    } else {
        appDelegateClass = AppDelegate.self
    }

#else

    appDelegateClass = AppDelegate.self

#endif

_ = UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))

