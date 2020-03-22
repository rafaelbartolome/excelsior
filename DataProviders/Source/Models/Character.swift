//
//  Character.swift
//  Models
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import MarvelClient

public struct Character {
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter
    }()
    
    public let id: Int
    public let name: String
    public let bio: String
    public let thumbnailURL: URL?
    public let modified: Date
}

extension Character {
    init(withResponse comicCharacter: ComicCharacter) {
        id = comicCharacter.id
        name = comicCharacter.name ?? "Unknown name"
        bio = comicCharacter.description ?? "There is no bio for this character"
        thumbnailURL = comicCharacter.thumbnail?.url
        if let modifiedString = comicCharacter.modified {
            let dateFormatter = Character.dateFormatter
            let date = dateFormatter.date(from: modifiedString)
            modified = date ?? Date()
        } else {
            modified = Date()
        }
    }
}
