//
//  CharactersListViewControllerFactory.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import UIKit
import CommonUIKit

/// Abstract factory that generates the right view controller given a view state
class CharactersListViewControllerFactory {
    // MARK: - Dependencies
    private let loadingViewControllerProvider: LoadingViewControllerProvider
    private let retryViewControllerProvider: RetryViewControllerProvider
    private let charactersListViewControllerProvider: CharactersListViewControllerProvider
    
    init(loadingViewControllerProvider: LoadingViewControllerProvider,
         retryViewControllerProvider: RetryViewControllerProvider,
         charactersListViewControllerProvider: CharactersListViewControllerProvider) {
        self.loadingViewControllerProvider = loadingViewControllerProvider
        self.retryViewControllerProvider = retryViewControllerProvider
        self.charactersListViewControllerProvider = charactersListViewControllerProvider
    }
}

extension CharactersListViewControllerFactory {
    func viewController(forState state: CharactersListState) -> UIViewController {
        switch state {
        case .loading(let detailText):
            return loadingViewControllerProvider.loadingViewController(detailText: detailText)
        case .charactersList(let characters):
            let charactersListViewController = charactersListViewControllerProvider.charactersListViewController(characters: characters)
            return charactersListViewController
        case let .loadError(title, description, delegate):
            let retryViewController = retryViewControllerProvider.retryViewController(title: title, descriptionText: description)
            retryViewController.delegate = delegate
            return retryViewController
        }
    }
}
