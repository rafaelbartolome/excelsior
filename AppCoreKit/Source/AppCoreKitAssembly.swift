//
//  AppCoreKitAssembly.swift
//  AppCoreKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import NavigatorKit
import CommonUIKit
import CharactersListKit
import CharacterDetailKit
import DataProviders
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
    private lazy var navigatorKit = NavigatorKitAssembly(window: Self.window)
    private lazy var mainNavigator = navigatorKit.navigator()
       
    // SetUp the launch coordinator with the first screen
    lazy var appLaunchCoordinator = AppLaunchCoordinator(mainNavigator: mainNavigator,
                                                                 firstScreen: charactersListKit.mainScreen)
    
    // Setup Common UI kit
    private lazy var commonUIKit = CommonUIKitAssembly()
    
    // SetUp data providers
    private lazy var dataProviders = DataProvidersAssembly()
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM ''yy"
        formatter.locale = .current
        
        return formatter
    }()

    // SetUp first feature framework - Characters list
    private lazy var charactersListKit = CharactersListKitAssembly(commonUIKit: commonUIKit,
                                                                   dataProviders: dataProviders,
                                                                   dateFormmater: dateFormatter,
                                                                   characterDetailNavigatorProvider: characterDetailKit
    )
    // SetUp second feature framework - Character detail
    private lazy var characterDetailKit = CharacterDetailKitAssembly(commonUIKit: commonUIKit,
                                                                   dataProviders: dataProviders,
                                                                   dateFormmater: dateFormatter,
                                                                   mainNavigator: mainNavigator)
}
