//
//  CharacterMother.swift
//  CharactersListKitTests
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
@testable import CharactersListKit

class CharacterMother {
    static let anyCharacter = CharacterListModel(id: 1,
                                                 name: "Superman",
                                                 thumbnailURL: nil,
                                                 modified: Date())
    static let anyOtherCharacter = CharacterListModel(id: 2,
                                                 name: "Batman",
                                                 thumbnailURL: nil,
                                                 modified: Date())
    static let anyCharacters = [anyCharacter, anyOtherCharacter]
}

