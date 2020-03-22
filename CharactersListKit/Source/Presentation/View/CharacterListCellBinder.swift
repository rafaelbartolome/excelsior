//
//  CharacterListCellBinder.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

/// CharacterListCellBinderProvider should be an abstract factory to return independent binders for different characters but for this example, just a binder is implemented
protocol CharacterListCellBinderProvider {
    func binderForCharacter(character: CharacterListModel) -> CharacterListCellBinder
}

class CharacterListCellBinder {
    private let character: CharacterListModel
    private let dateFormatter: DateFormatter
    init(character: CharacterListModel,
         dateFormatter: DateFormatter) {
        self.character = character
        self.dateFormatter = dateFormatter
    }
}

extension CharacterListCellBinder {
    func bind(to cell: CharactersListCell) {
        #warning("TODO: WIP bind cell")
        cell.header = character.name
        let dateString = dateFormatter.string(from: character.modified)
        cell.descriptionText = "Last updated: \(dateString)"
    }
}
