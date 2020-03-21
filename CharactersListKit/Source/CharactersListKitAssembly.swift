//
//  CharactersListKitAssembly.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import NavigatorKit
import UIKit

/// This is the assembly for the feature - Characters List.

public final class CharactersListKitAssembly {
    
    public init() {}
    
    public var mainScreen : Screen {
        CharactersListScreen(charactersListContainerViewControllerProvider: self)
    }
    
    func charactersListContainerPresenter() -> CharactersListContainerPresenter {
        CharactersListContainerPresenter()
    }
}

extension CharactersListKitAssembly: CharactersListContainerViewControllerProvider {
    func charactersListContainerViewController() -> CharactersListContainerViewController {
        let bundle = Bundle(for: CharactersListContainerViewController.self)

        let storyboard = UIStoryboard(name: CharactersListContainerViewController.storyboard, bundle: bundle)
        return CharactersListContainerViewController.createWith(storyboard: storyboard,
                                                       charactersListContainerPresenter: charactersListContainerPresenter())
    }
}
