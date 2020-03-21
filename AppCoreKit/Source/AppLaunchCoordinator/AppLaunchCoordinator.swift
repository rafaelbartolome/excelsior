//
//  AppLaunchCoordinator.swift
//  AppCoreKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import NavigatorKit
import UIKit

#warning("TODO: WIP")
typealias MainNavigator = AnyObject

/// AppLaunchCoordinator manages all lifecycle of the app.
class AppLaunchCoordinator {
    
    // Dependencies
    private let mainNavigator: Navigator
    
    private let firstScreen: Screen
    
    init(mainNavigator: Navigator,
         firstScreen: Screen) {
        self.mainNavigator = mainNavigator
        self.firstScreen = firstScreen
    }

}

// MARK: Public functions

extension AppLaunchCoordinator {
    
    // MARK: App lifecycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        setUpMainScreen()
    }

    func applicationWillResignActive() {
        //...
    }
    
    func applicationDidEnterBackground() {
        //...
    }
    
    func applicationWillEnterForeground() {
        //...
    }
    
    func applicationDidBecomeActive() {
        //...
    }
    
    func applicationWillTerminate() {
        //...
    }
    
    // MARK: Notifications
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        //...
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        //...
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        //...
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        //...
    }
}

private extension AppLaunchCoordinator {
    func setUpMainScreen() {
        mainNavigator.handle(navigation: .root(firstScreen))
    }
}

