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

class CharactersListViewControllerFactory {
    // MARK: - Dependencies
    private let loadingViewControllerProvider: LoadingViewControllerProvider
    private let retryViewControllerProvider: RetryViewControllerProvider

    
    init(loadingViewControllerProvider: LoadingViewControllerProvider,
         retryViewControllerProvider: RetryViewControllerProvider) {
        self.loadingViewControllerProvider = loadingViewControllerProvider
        self.retryViewControllerProvider = retryViewControllerProvider
    }
}

extension CharactersListViewControllerFactory {
    func viewController(forState state: CharactersListState) -> UIViewController {
        switch state {
        case .loading(let detailText):
            return loadingViewControllerProvider.loadingViewController(detailText: detailText)
        case .charactersList:
            return UIViewController()
        case let .loadError(title, description, delegate):
            let retryViewController = retryViewControllerProvider.retryViewController(title: title, descriptionText: description)
            retryViewController.delegate = delegate
            return retryViewController
        }
    }
}
