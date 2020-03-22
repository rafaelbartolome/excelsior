//
//  CharactersListContainerViewMock.swift
//  CharactersListKitTests
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
@testable import CharactersListKit

class CharactersListContainerViewMock: CharactersListContainerView {
    
    var showViewCalls: [CharactersListState] = []
    func showView(forState state: CharactersListState) {
        showViewCalls.append(state)
    }
}
