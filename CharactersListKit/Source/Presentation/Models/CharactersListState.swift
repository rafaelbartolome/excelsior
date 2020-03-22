//
//  CharactersListState.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import CommonUIKit

/// States of character list and associated values (Sum type)
enum CharactersListState {
    case loading(String)
    case charactersList([CharacterListModel],
        offset: Int,
        delegate: CharactersListPresenterDelegate)
    case loadError(title: String, description: String, delegate: RetryViewControllerDelegate)
}

extension CharactersListState: Equatable {
    static func == (lhs: CharactersListState, rhs: CharactersListState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.charactersList(let lCharacters, _, _), .charactersList(let rCharacters, _, _)):
            return lCharacters == rCharacters
        case (.loadError, .loadError):
            return true
        default:
            return false
        }
    }
}
