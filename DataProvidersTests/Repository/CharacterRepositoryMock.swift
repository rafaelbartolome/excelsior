//
//  CharacterRepositoryMock.swift
//  DataProvidersTests
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import DataProviders

class CharacterRepositoryMock: CharacterRepository {
    var charactersCalls: [(String?, Int?,CharactersCompletion)] = []
    func characters(nameStartsWith: String?,
                    offset: Int?,
                    completion: @escaping CharactersCompletion) {
        charactersCalls.append((nameStartsWith, offset, completion))
    }
    
    var characterCalls: [(Int?,CharacterCompletion)] = []
    func character(with id: Int, completion: @escaping CharacterCompletion) {
        characterCalls.append((id, completion))
    }
}
