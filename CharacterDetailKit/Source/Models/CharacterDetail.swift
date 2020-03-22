//
//  CharacterDetail.swift
//  CharacterDetailKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import DataProviders

typealias CharacterId = Int

struct CharacterDetail {
    public let id: CharacterId
    public let name: String
    public let thumbnailURL: URL?
    public let bio: String
}

/// Mapper between data providers domain and presentation domain
extension CharacterDetail {
    init(with character: Character) {
        id = character.id
        name = character.name
        thumbnailURL = character.thumbnailURL
        bio = character.bio
    }
}
