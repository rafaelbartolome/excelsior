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
        CharactersListScreen(charactersListViewControllerProvider: self)
    }
    
    func charactersListPresenter() -> CharactersListPresenter {
        CharactersListPresenter()
    }
}

extension CharactersListKitAssembly: CharactersListViewControllerProvider {
    func charactersListViewController() -> CharactersListViewController {
        let storyboard = UIStoryboard(name: CharactersListViewController.storyboard, bundle: nil)
        return CharactersListViewController.createWith(storyboard: storyboard,
                                                       charactersListPresenter: charactersListPresenter())
    }
}
