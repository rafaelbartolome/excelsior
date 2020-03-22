//
//  CharacterDetailContainerPresenter.swift
//  CharacterDetailKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import CommonUIKit

/// CharacterDetailContainerPresenter in the presenter in charge of retrieve details for a character and set the view into the right state
final class CharacterDetailContainerPresenter{
    weak var view: CharacterDetailContainerView!
    
    private let getCharacterDetail: GetCharacterDetail
    private let characterId: CharacterId
    
    private var searchString: String?
    private var offset = 0
    
    init(getCharacterDetail: GetCharacterDetail,
         characterId: CharacterId) {
        self.getCharacterDetail = getCharacterDetail
        self.characterId = characterId
    }
}

extension CharacterDetailContainerPresenter {
    func didLoad() {
        load()
    }
}


private extension CharacterDetailContainerPresenter {
    func loadCharacterDetail() {
        /// Interactor returns always in main thread
        getCharacterDetail.execute(with: characterId) { [weak self] result in
                                guard let s = self else { return }
                                switch result {
                                case .success(let characterDetail):
                                    s.getCharactersFinished(with: characterDetail)
                                case .failure(let error):
                                    s.getCharactersFinished(with: error)
                                }
        }
    }
    
    func getCharactersFinished(with characterDetail: CharacterDetail) {
        view.showView(forState: .loaded(characterDetail))
    }
    
    func getCharactersFinished(with error: CharacterDetailError) {
        view.showView(forState: .loadError(title: "Something was wrong",  //TODO: Localization
            description: error.localizedDescription,
            delegate: self))
    }
    
    func load() {
        view.showView(forState: .loading("Loading character detail ...")) //TODO: Localization
        loadCharacterDetail()
    }
}

extension CharacterDetailContainerPresenter: RetryViewControllerDelegate {
    func retryViewDidTapOnButton() {
        load()
    }
}
