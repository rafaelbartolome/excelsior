//
//  CharacterDetailViewControllerFactory.swift
//  CharacterDetailKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import UIKit
import CommonUIKit

/// Abstract factory that generates the right view controller given a view state
class CharacterDetailViewControllerFactory {
    // MARK: - Dependencies
    private let loadingViewControllerProvider: LoadingViewControllerProvider
    private let retryViewControllerProvider: RetryViewControllerProvider
    private let characterDetailViewControllerProvider: CharacterDetailViewControllerProvider
    
    init(loadingViewControllerProvider: LoadingViewControllerProvider,
         retryViewControllerProvider: RetryViewControllerProvider,
         characterDetailViewControllerProvider: CharacterDetailViewControllerProvider) {
        self.loadingViewControllerProvider = loadingViewControllerProvider
        self.retryViewControllerProvider = retryViewControllerProvider
        self.characterDetailViewControllerProvider = characterDetailViewControllerProvider
    }
}

extension CharacterDetailViewControllerFactory {
    func viewController(forState state: CharacterDetailState) -> UIViewController {
        switch state {
        case .loading(let detailText):
            return loadingViewControllerProvider.loadingViewController(detailText: detailText)
        case .loaded(let characterDetail):
            let characterDetailViewController = characterDetailViewControllerProvider.characterDetailViewController(character: characterDetail)
            return characterDetailViewController
        case let .loadError(title, description, delegate):
            let retryViewController = retryViewControllerProvider.retryViewController(title: title, descriptionText: description)
            retryViewController.delegate = delegate
            return retryViewController
        }
    }
}
