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
import CommonUIKit
import DataProviders
import ToolsKit

/// This is the assembly for the feature - Characters List.

public final class CharactersListKitAssembly {
    
    private let commonUIKit: CommonUIKitAssembly
    private let dataProviders: DataProvidersAssembly
    
    public init(commonUIKit: CommonUIKitAssembly,
                dataProviders: DataProvidersAssembly) {
        self.commonUIKit = commonUIKit
        self.dataProviders = dataProviders
    }
    
    public var mainScreen : Screen {
        CharactersListScreen(charactersListContainerViewControllerProvider: self)
    }
    
    func charactersListContainerPresenter() -> CharactersListContainerPresenter {
        CharactersListContainerPresenter(getCharacters: getCharacters())
    }
    
    func charactersListViewControllerFactory() -> CharactersListViewControllerFactory {
        CharactersListViewControllerFactory(loadingViewControllerProvider: commonUIKit)
    }
    
    func getCharacters() -> GetCharacters {
        GetCharacters(characterRepository: dataProviders.CharactersRepository,
                      schedulerFactory: GCDSchedulerFactory())
    }
}

extension CharactersListKitAssembly: CharactersListContainerViewControllerProvider {
    func charactersListContainerViewController() -> CharactersListContainerViewController {
        let bundle = Bundle(for: CharactersListContainerViewController.self)

        let storyboard = UIStoryboard(name: CharactersListContainerViewController.storyboard, bundle: bundle)
        return CharactersListContainerViewController.createWith(storyboard: storyboard,
                                                                charactersListContainerPresenter: charactersListContainerPresenter(),
                                                                charactersListViewControllerFactory: charactersListViewControllerFactory())
    }
}
