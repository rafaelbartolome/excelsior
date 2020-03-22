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
    private let dateFormmater: DateFormatter
    private unowned var characterDetailNavigatorProvider: CharacterDetailNavigatorProvider
    
    public init(commonUIKit: CommonUIKitAssembly,
                dataProviders: DataProvidersAssembly,
                dateFormmater: DateFormatter,
                characterDetailNavigatorProvider: CharacterDetailNavigatorProvider) {
        self.commonUIKit = commonUIKit
        self.dataProviders = dataProviders
        self.dateFormmater = dateFormmater
        self.characterDetailNavigatorProvider = characterDetailNavigatorProvider
    }
    
    public var mainScreen : Screen {
        CharactersListScreen(charactersListContainerViewControllerProvider: self)
    }
    
    func charactersListContainerPresenter() -> CharactersListContainerPresenter {
        CharactersListContainerPresenter(getCharacters: getCharacters())
    }
    
    func charactersListViewControllerFactory() -> CharactersListViewControllerFactory {
        CharactersListViewControllerFactory(loadingViewControllerProvider: commonUIKit,
                                            retryViewControllerProvider: commonUIKit,
                                            charactersListViewControllerProvider: self)
    }
    
    func getCharacters() -> GetCharacters {
        GetCharacters(characterRepository: dataProviders.CharactersRepository,
                      schedulerFactory: GCDSchedulerFactory())
    }
    
    func charactersListPresenter(characters: [CharacterListModel]) -> CharactersListPresenter {
        CharactersListPresenter(characters: characters, navigator: characterDetailNavigatorProvider.characterDetailNavigator())
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

extension CharactersListKitAssembly: CharactersListViewControllerProvider {
    func charactersListViewController(characters: [CharacterListModel]) -> CharactersListViewController {
        CharactersListViewController(charactersListPresenter: charactersListPresenter(characters: characters),
                                     cellBinderProvider: self)
    }
}

extension CharactersListKitAssembly: CharacterListCellBinderProvider{
    /// default implementation of a fake factory
    func binderForCharacter(character: CharacterListModel) -> CharacterListCellBinder {
        CharacterListCellBinder(character: character, dateFormatter: dateFormmater)
    }
}
