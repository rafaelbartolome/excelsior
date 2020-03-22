//
//  CharactersListPresenterDelegateMock.swift
//  CharactersListKitTests
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
@testable import CharactersListKit

class CharactersListPresenterDelegateMock: CharactersListPresenterDelegate {
    var loadMoreCalls = 0
    func loadMore() {
        loadMoreCalls += 1
    }
}
