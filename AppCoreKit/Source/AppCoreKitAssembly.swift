//
//  AppCoreKitAssembly.swift
//  AppCoreKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import UIKit

public protocol AppCoreKitAssemblyProviderProtocol {
    func appCoreKitAssembly() -> AppCoreKitAssembly
}

public final class AppCoreKitAssembly {
    
    static var current: AppCoreKitAssembly!
    
    static let window = UIWindow()
    
    #warning("TODO: WIP")
    lazy var appLaunchCoordinator = AppLaunchCoordinator(mainNavigator: self)
    
}
