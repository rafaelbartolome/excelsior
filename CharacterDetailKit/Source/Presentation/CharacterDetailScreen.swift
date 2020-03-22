//
//  CharacterDetailScreen.swift
//  CharacterDetailKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import NavigatorKit
import UIKit

/// CharacterDetailScreen in the main screen for the character detail feature
class CharacterDetailScreen: Screen {
    enum Params {
        static let characterId = "CharacterId"
    }
    
    private unowned let characterDetailContainerViewControllerProvider: CharacterDetailContainerViewControllerProvider
    
    init(characterDetailContainerViewControllerProvider: CharacterDetailContainerViewControllerProvider) {
        self.characterDetailContainerViewControllerProvider = characterDetailContainerViewControllerProvider
    }
    
    func viewController(with params: ScreenParams?) -> UIViewController {
        guard let characterId = params?[Params.characterId] as? CharacterId else {
            fatalError("Cant navigate to details without an ID")
        }
        return characterDetailContainerViewControllerProvider.characterDetailContainerViewController(characterId: characterId)
    }
}
