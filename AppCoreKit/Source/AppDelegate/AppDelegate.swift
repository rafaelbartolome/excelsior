//
//  AppDelegate.swift
//  excelsior
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import UIKit

public class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public var window: UIWindow?
    
    /// appLaunchCoordinator will manage all lifecycle of the app to avoid too much code in the App delegate
    private var appLaunchCoordinator: AppLaunchCoordinator!

    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setUpAppDelegateDependencies()
        setUpWindow()
        
        appLaunchCoordinator.application(application, didFinishLaunchingWithOptions: launchOptions ?? [:])
        
        return true
    }
    
   public func applicationWillResignActive(_ application: UIApplication) {
        appLaunchCoordinator.applicationWillResignActive()
    }
    
   public func applicationDidEnterBackground(_ application: UIApplication) {
        appLaunchCoordinator.applicationDidEnterBackground()
    }
    
   public func applicationWillEnterForeground(_ application: UIApplication) {
        appLaunchCoordinator.applicationWillEnterForeground()
    }
    
   public func applicationDidBecomeActive(_ application: UIApplication) {
        appLaunchCoordinator.applicationDidBecomeActive()
    }
    
    public func applicationWillTerminate(_ application: UIApplication) {
        appLaunchCoordinator.applicationWillTerminate()
    }
    
    // MARK: Notifications
    
   public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        appLaunchCoordinator.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        appLaunchCoordinator.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
    }
    
//    public func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
//        appLaunchCoordinator.application(application, didReceiveRemoteNotification: userInfo)
//    }
    
    
    public func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        appLaunchCoordinator.application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
    }

}

private extension AppDelegate {
  
    func setUpAppDelegateDependencies() {
        if AppCoreKitAssembly.current == nil {
            AppCoreKitAssembly.current = AppCoreKitAssembly()
        }
        let appCoreKitAssembly = AppCoreKitAssembly.current!
        
        appLaunchCoordinator = appCoreKitAssembly.appLaunchCoordinator
    }
    
    func setUpWindow() {
        window = AppCoreKitAssembly.window
        window!.frame = UIScreen.main.bounds
    }
    
}


