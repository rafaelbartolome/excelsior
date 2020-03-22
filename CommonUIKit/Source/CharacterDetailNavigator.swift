//
//  CharacterDetailNavigator.swift
//  CommonUIKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

public protocol CharacterDetailNavigatorProvider: AnyObject {
    func characterDetailNavigator() -> CharacterDetailNavigator
}

public protocol CharacterDetailNavigator {
    func navigateToCharacterDetail(withIdentifier: Int)
}
