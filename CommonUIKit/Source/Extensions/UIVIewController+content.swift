//
//  UIVewController+content.swift
//  CommonUIKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    public func setContentViewController(_ viewController: UIViewController, in view: UIView, withPreviousViewControler previousVC: UIViewController?) {
        
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
        viewController.view.alpha = 0
        
        UIView.animate(withDuration: 0.4, animations: {
            viewController.view.alpha = 1
        }) { _ in
            if let childVC = previousVC {
                childVC.willMove(toParent: nil)
                childVC.view.removeFromSuperview()
                childVC.removeFromParent()
            }
        }
    }
}
