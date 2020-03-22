//
//  CharacterDetailState.swift
//  CharacterDetailKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import CommonUIKit

/// States of character detail view and associated values (Sum type)
enum CharacterDetailState {
    case loading(String)
    case loaded(CharacterDetail)
    case loadError(title: String, description: String, delegate: RetryViewControllerDelegate)
}
