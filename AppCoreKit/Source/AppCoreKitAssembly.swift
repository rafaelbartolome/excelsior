//
//  AppCoreKitAssembly.swift
//  AppCoreKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import NavigatorKit
import CharactersListKit
import UIKit

public protocol AppCoreKitAssemblyProviderProtocol {
    func appCoreKitAssembly() -> AppCoreKitAssembly
}

/// This is the main assembly in charge of creating all dependencies for the App.
/// It's created in the AppDelegate when the app starts.

public final class AppCoreKitAssembly {
    
    static var current: AppCoreKitAssembly!
    
    static let window = UIWindow()

    // Setup navigation kit
    lazy var navigatorKit = NavigatorKitAssembly(window: Self.window)
    lazy var mainNavigator = navigatorKit.navigator()
    
    // SetUp first feature framework - Characters list
    lazy var charactersListKit = CharactersListKitAssembly()
    
    // SetUp the launch coordinator with the first screen
    lazy var appLaunchCoordinator = AppLaunchCoordinator(mainNavigator: mainNavigator,
                                                         firstScreen: charactersListKit.mainScreen)
}
