//
//  CharacterService.swift
//  Models
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

protocol CharacterServiceProtocol: AnyObject {
    func characters(nameStartsWith: String?,
                    offset: Int?,
                    completion: @escaping CharactersCompletion)
    func character(with id: Int, completion: @escaping CharacterCompletion)
}

class CharacterService {
    #warning("TODO: WIP missing API")

}

extension CharacterService: CharacterServiceProtocol {
    func characters(nameStartsWith: String?,
                    offset: Int?,
                    completion: @escaping CharactersCompletion) {
        
        #warning("TODO: WIP fake data")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.failure(.notFound))
        }
    }
    
    func character(with id: Int, completion: @escaping CharacterCompletion) {
        #warning("TODO: WIP fake data")
        completion(.failure(.notFound))
    }
}
