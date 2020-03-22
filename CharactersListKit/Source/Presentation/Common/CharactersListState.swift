//
//  CharactersListState.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import CommonUIKit
import DataProviders

enum CharactersListState {
    case loading(String)
    case charactersList([Character])
    case loadError(title: String, description: String, delegate: RetryViewControllerDelegate)
}
