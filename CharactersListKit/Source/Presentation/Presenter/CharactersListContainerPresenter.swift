//
//  CharactersListContainerPresenter.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

class CharactersListContainerPresenter{
    weak var view: CharactersListContainerView!
    
    private var searchString: String?
    private var offset = 0
    
    init() {
        
    }
}

extension CharactersListContainerPresenter {
    func didLoad() {
        view.showView(forState: .loading("Loading characters list ...")) //TODO: Localization
        loadCharactesrsList()
    }
}


private extension CharactersListContainerPresenter {
    func loadCharactesrsList() {
        #warning("TODO: WIP")

//        getCharactersList.execute()
    }
}
