//
//  Navigation.swift
//  NavigatorKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import UIKit

public enum Navigation {
    case root(
        Screen,
        ScreenParams? = nil
    )
    case push(
        Screen,
        ScreenParams? = nil
    )
    case present(
        Screen,
        ScreenParams? = nil
    )
}
