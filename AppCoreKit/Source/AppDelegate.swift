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


    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setUpAppDelegateDependencies()
        setUpWindow()
        setUpFirstScreen()
        
        return true
    }
}

private extension AppDelegate {
    func setUpAppDelegateDependencies() {
//        if AppAssembly.current == nil {
//            AppAssembly.current = AppAssembly()
//        }
    }
    
    func setUpWindow() {
        window = UIWindow()// AppAssembly.window
        window?.frame = UIScreen.main.bounds
        window?.backgroundColor = .white
    }
    
    func setUpFirstScreen() {
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
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
        
        
    }
    
}


