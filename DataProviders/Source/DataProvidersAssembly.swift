//
//  DataProvidersAssembly.swift
//  DataProviders
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

public class DataProvidersAssembly {
    
    public init() {}
    
    public lazy var CharactersRepository: CharacterRepository =  InternalCharacterRepository(characterService: characterService)
    
    private lazy var characterService: CharacterServiceProtocol = CharacterService()
    
}
