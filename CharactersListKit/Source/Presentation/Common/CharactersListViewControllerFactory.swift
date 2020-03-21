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
    
    init(loadingViewControllerProvider: LoadingViewControllerProvider) {
        self.loadingViewControllerProvider = loadingViewControllerProvider
    }
}

#warning("TODO: WIP")
typealias LoadErrorViewControllerDelegate = Any

extension CharactersListViewControllerFactory {
    func viewController(forState state: CharactersListState, loadErrorDelegate: LoadErrorViewControllerDelegate?) -> UIViewController {
        switch state {
        case .loading(let detailText):
            return loadingViewControllerProvider.loadingViewController(detailText: detailText)
        case .charactersList:
            return UIViewController()
        case let .loadError(title, description, delegate):
//            let loadErrorViewController = loadErrorViewControllerProvider.loadErrorViewController(descriptionText: description)
//            loadErrorViewController.delegate = loadErrorDelegate
            return UIViewController()
        }
    }
}
