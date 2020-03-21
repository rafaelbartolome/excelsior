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
    
    private let getCharacters: GetCharacters
    
    private var searchString: String?
    private var offset = 0
    
    init(getCharacters: GetCharacters) {
        self.getCharacters = getCharacters
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
        getCharacters.execute(nameStartsWith: searchString,
                              offset: offset) { [weak self] result in
                                switch result {
                                case .success(let characters):
                                    #warning("TODO: WIP")

                                    break
                                case .failure(let error):
                                    #warning("TODO: WIP")
                                    
                                    break
                                }
        }
    }
}
