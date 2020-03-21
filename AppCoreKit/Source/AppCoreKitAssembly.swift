//
//  AppCoreKitAssembly.swift
//  AppCoreKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import NavigatorKit
import UIKit

public protocol AppCoreKitAssemblyProviderProtocol {
    func appCoreKitAssembly() -> AppCoreKitAssembly
}

public final class AppCoreKitAssembly {
    
    static var current: AppCoreKitAssembly!
    
    static let window = UIWindow()
    
    lazy var navigatorKit = NavigatorKitAssembly(window: Self.window)
    lazy var mainNavigator = navigatorKit.navigator()
    
    #warning("TODO: WIP")
    lazy var appLaunchCoordinator = AppLaunchCoordinator(mainNavigator: mainNavigator,
                                                         firstScreen: FirstScreen())
}

class FirstScreen: Screen {
    func viewController(with params: ScreenParams?) -> UIViewController {
        let bundle = Bundle(for: ViewController.self)
        //        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
        guard let mainVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController  else {
            fatalError("Can't create AccountsViewController from storyboard")
        }
        
        return mainVC
    }
}
