//
//  CharactersListContainerPresenter.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import CommonUIKit

/// CharactersListContainerPresenter in the presenter in charge of retrieve all characters and set the view into the right state
final class CharactersListContainerPresenter{
    weak var view: CharactersListContainerView!
    
    private let getCharacters: GetCharacters
    
    //TODO: Implement search
    private var searchString: String?
    private var offset = 0
    private var characters: [CharacterListModel] = []
    // Flag to avoid concurrent calls
    private var loading = false
    
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
        guard !loading else { return }
        
        loading = true
        /// Interactor returns always in main thread
        getCharacters.execute(nameStartsWith: searchString,
                              offset: offset) { [weak self] result in
                                guard let s = self else { return }
                                s.loading = false
                                switch result {
                                case .success(let characters):
                                    s.getCharactersFinished(with: characters)
                                case .failure(let error):
                                    s.getCharactersFinished(with: error)
                                }
        }
    }
    
    func getCharactersFinished(with newCharacters: [CharacterListModel]) {
        //TODO: Instead of reloading the full view with an offset, try to reload it just adding the new elements.
        characters += newCharacters
        view.showView(forState: .charactersList(characters, offset: offset - 1 , delegate: self))
        offset = characters.count
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

extension CharactersListContainerPresenter: CharactersListPresenterDelegate {
    func loadMore() {
        loadCharactersList()
    }
}
