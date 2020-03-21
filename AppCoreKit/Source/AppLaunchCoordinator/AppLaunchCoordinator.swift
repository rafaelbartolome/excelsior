//
//  AppLaunchCoordinator.swift
//  AppCoreKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import UIKit

#warning("TODO: WIP")
typealias MainNavigator = AnyObject

/// AppLaunchCoordinator manages all lifecycle of the app.
class AppLaunchCoordinator {
    
    // Dependencies
    private let mainNavigator: MainNavigator
    
    init(mainNavigator: MainNavigator) {
        self.mainNavigator = mainNavigator
    }

}

// MARK: Public functions

extension AppLaunchCoordinator {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        #warning("TODO: WIP")

//        mainNavigator.navigateToCharacterList()
        setUpFirstScreen()
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
    
    func setUpFirstScreen() {
        #warning("TODO: WIP")

        //        let mainScreenViewController = AppAssembly.current.mainScreenViewController()
        //
        //        window?.rootViewController = mainScreenViewController
        //        window?.makeKeyAndVisible()
        
        let bundle = Bundle(for: ViewController.self)
        //        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
        guard let mainVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController  else {
            fatalError("Can't create AccountsViewController from storyboard")
        }
        AppCoreKitAssembly.window.rootViewController = mainVC
        AppCoreKitAssembly.window.makeKeyAndVisible()
        
        
    }
}

