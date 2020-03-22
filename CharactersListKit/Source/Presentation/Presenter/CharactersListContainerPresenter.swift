//
//  CharactersListContainerPresenter.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import CommonUIKit

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
        loadCharactersList()
    }
}


private extension CharactersListContainerPresenter {
    func loadCharactersList() {
        /// Interactor returns always in main thread
        getCharacters.execute(nameStartsWith: searchString,
                              offset: offset) { [weak self] result in
                                guard let s = self else { return }
                                switch result {
                                case .success(let characters):
                                    #warning("TODO: WIP")

                                    break
                                case .failure(let error):
                                    s.getCharactersFinished(with: error)
                                }
        }
    }
    
    func getCharactersFinished(with error: CharacterListError) {
        view.showView(forState: .loadError(title: "Something was wrong",  //TODO: Localization
                                           description: error.localizedDescription,
                                           delegate: self))
    }
    
    
    func retry() {
        view.showView(forState: .loading("Loading characters list ...")) //TODO: Localization
        loadCharactersList()
    }
}

extension CharactersListContainerPresenter: RetryViewControllerDelegate {
    func retryViewDidTapOnButton() {
        retry()
    }
}
