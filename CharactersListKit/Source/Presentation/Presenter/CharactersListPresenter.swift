//
//  CharactersListPresenter.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

/// CharactersListPresenter is the presenter for the list of characters
final class CharactersListPresenter {
    private let characters: [CharacterListModel]
    
    // MARK: - Dependencies
//    private let navigator: Navigator
    
    init(characters: [CharacterListModel]){
//         navigator: Navigator) {
        self.characters = characters
//        self.navigator = navigator
    }
}

extension CharactersListPresenter {
    
    var numberOfCharacters: Int {
        characters.count
    }
    
    func character(for index: Int) -> CharacterListModel {
        characters[index]
    }
        
    func characterSelected(at index: Int) {
        #warning("TODO: WIP navigate to detail")

//        let character = characters[index]
//        navigator.navigateToCharacterDetail(withIdentifier: character.id)
    }
}

