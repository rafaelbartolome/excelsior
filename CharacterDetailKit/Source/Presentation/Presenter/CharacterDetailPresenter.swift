//
//  CharacterDetailPresenter.swift
//  CharacterDetailKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

/// CharacterDetailPresenter is the presenter for a character detail
final class CharacterDetailPresenter {
    weak var view: CharacterDetailView!
    
    private let character: CharacterDetail
       
    init(character: CharacterDetail){
        self.character = character
    }
}

extension CharacterDetailPresenter {   
    func didLoad() {
        view.setUpName(character.name)
        view.setUpBio(character.bio)
        view.setUpImage(character.thumbnailURL)
    }
}

