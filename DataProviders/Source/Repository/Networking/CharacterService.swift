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
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            completion(.failure(.notFound))
//        }
        
        let c1 = Character(id: 1,
                           name: "Thor", bio: "Thor es guay",
                           thumbnailURL: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/7/30/5e67fba816991/portrait_uncanny.jpg")!,
                           modified: Date())
        let c2 = Character(id: 2,
                           name: "IronMan", bio: "Tambien es guay",
                           thumbnailURL: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/9/30/5e67aa73b0d81/portrait_uncanny.jpg")!,
                           modified: Date())
        let c3 = Character(id: 3,
                           name: "Super Lopez", bio: "Tambien es guay",
                           thumbnailURL: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/9/30/4/portrait_uncanny.jpg")!,
                           modified: Date())
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(.success([c1, c2, c3]))
        }
        
    }
    
    func character(with id: Int, completion: @escaping CharacterCompletion) {
        #warning("TODO: WIP fake data")
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                    completion(.failure(.notFound))
//                }
        let c1 = Character(id: 1,
                           name: "Thor", bio: "Thor es guay",
                           thumbnailURL: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/7/30/5e67fba816991/portrait_uncanny.jpg")!,
                           modified: Date())
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(c1))
        }
    }
}
