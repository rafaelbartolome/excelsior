//
//  CharactersListScreen.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import NavigatorKit
import UIKit

/// CharactersListScreen in the main screen for the character list feature
class CharactersListScreen: Screen {
    private unowned let charactersListContainerViewControllerProvider: CharactersListContainerViewControllerProvider
    
    init(charactersListContainerViewControllerProvider: CharactersListContainerViewControllerProvider) {
        self.charactersListContainerViewControllerProvider = charactersListContainerViewControllerProvider
    }
    
    func viewController(with params: ScreenParams?) -> UIViewController {
        return charactersListContainerViewControllerProvider.charactersListContainerViewController()
    }
}
