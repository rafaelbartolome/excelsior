//
//  CharacterDetailNavigatorMock.swift
//  CharactersListKitTests
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import CommonUIKit

class CharacterDetailNavigatorMock: CharacterDetailNavigator{
    
    var navigateToCharacterDetailCalls: [Int] = []
    func navigateToCharacterDetail(withIdentifier id: Int) {
        navigateToCharacterDetailCalls.append(id)
    }

    
}
