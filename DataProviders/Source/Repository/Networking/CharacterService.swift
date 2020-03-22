//
//  CharacterService.swift
//  Models
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import MarvelClient

protocol CharacterServiceProtocol: AnyObject {
    func characters(nameStartsWith: String?,
                    offset: Int?,
                    completion: @escaping CharactersCompletion)
    func character(with id: Int, completion: @escaping CharacterCompletion)
}

class CharacterService {
    let apiClient: MarvelAPIClient
    
    init(apiClient: MarvelAPIClient) {
        self.apiClient = apiClient
    }
}

extension CharacterService: CharacterServiceProtocol {
    func characters(nameStartsWith: String?,
                    offset: Int?,
                    completion: @escaping CharactersCompletion) {
        
        let request = GetCharacters(name: nil,
                                    nameStartsWith: nameStartsWith,
                                    offset: offset)
        apiClient.send(request) { response in
            switch response {
            case .success(let dataContainer):
                let networkCharacters = dataContainer.results
                guard networkCharacters.count != 0 else {
                    completion(.failure(.notFound))
                    return
                }
                
                let characters = networkCharacters.map { Character(withResponse: $0)}
                
                completion(.success(characters))
            case .failure(let error):
                completion(.failure(CharacterRepositoryError(withResponseError: error)))
            }
        }
    }
    
    func character(with id: Int, completion: @escaping CharacterCompletion) {
        let request = GetCharacter(characterId: id)
        apiClient.send(request) { response in
            switch response {
            case .success(let dataContainer):
                let networkCharacters = dataContainer.results
                guard let networkCharacter = networkCharacters.first else {
                    completion(.failure(.notFound))
                    return
                }
                let character = Character(withResponse: networkCharacter)
                
                completion(.success(character))
            case .failure(let error):
                completion(.failure(CharacterRepositoryError(withResponseError: error)))
            }
        }
    }
}
