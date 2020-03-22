//
//  CharacterListModel.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import DataProviders

struct CharacterListModel {
    public let id: Int
    public let name: String
    public let bio: String
    public let modified: Date
}

/// Mapper between data providers domain and presentation domain
extension CharacterListModel {
    init(with character: Character) {
        id = character.id
        name = character.name
        bio = character.bio
        modified = character.modified
    }
}
