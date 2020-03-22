//
//  GetCharactersMock.swift
//  CharactersListKitTests
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
@testable import CharactersListKit

class GetCharactersMock: GetCharactersProtocol {
    
    var executeCalls: [(String?, Int?, (Result<[CharacterListModel], CharacterListError>) -> Void)] = []
    func execute(nameStartsWith: String?,
                 offset: Int?,
                 completion: @escaping (Result<[CharacterListModel], CharacterListError>) -> Void) {
        executeCalls.append((nameStartsWith, offset, completion))
    }
}
