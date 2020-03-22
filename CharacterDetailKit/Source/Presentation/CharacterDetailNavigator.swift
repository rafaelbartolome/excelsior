//
//  CharacterDetailNavigator.swift
//  CharacterDetailKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import NavigatorKit
import CommonUIKit


class InternalCharacterDetailNavigator {
    // Dependencies
    private let mainNavigator: Navigator
    private let detailScreen: CharacterDetailScreen
    
    init(mainNavigator: Navigator,
         detailScreen: CharacterDetailScreen) {
        self.mainNavigator = mainNavigator
        self.detailScreen = detailScreen
    }
}

extension InternalCharacterDetailNavigator: CharacterDetailNavigator {
    func navigateToCharacterDetail(withIdentifier characterId: Int) {
        let screenParams = [CharacterDetailScreen.Params.characterId: characterId]
        mainNavigator.handle(navigation: .push(detailScreen, screenParams))
    }
}
