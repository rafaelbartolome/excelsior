//
//  GetCharacters.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import DataProviders
import ToolsKit

protocol GetCharactersProtocol: AnyObject {
    func execute(nameStartsWith: String?,
                 offset: Int?,
                 completion: @escaping (Result<[Character], CharacterListError>) -> Void)
}

class GetCharacters{
    let characterRepository: CharacterRepository
    let mainThreadScheduler: Scheduler
    
    init(characterRepository: CharacterRepository,
         schedulerFactory: SchedulerFactory) {
        self.characterRepository = characterRepository
        mainThreadScheduler = schedulerFactory.mainThreadScheduler
    }
}

extension GetCharacters: GetCharactersProtocol {
    func execute(nameStartsWith name: String?,
                 offset: Int?,
                 completion: @escaping (Result<[Character], CharacterListError>) -> Void) {
        characterRepository.characters(nameStartsWith: name,
                                       offset: offset) { [weak self] result in
                                        self?.mainThreadScheduler.scheduleAsync {
                                            switch result {
                                            case .success(let characters):
                                                completion(.success(characters))
                                            case .failure(let repoError):
                                                completion(.failure(CharacterListError(characterRepositoryError: repoError)))
                                            }
                                        }
        }
    }
}
