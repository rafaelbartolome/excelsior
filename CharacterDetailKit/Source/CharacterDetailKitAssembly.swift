//
//  CharacterDetailKitAssembly.swift
//  CharacterDetailKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import NavigatorKit
import UIKit
import CommonUIKit
import DataProviders
import ToolsKit

/// This is the assembly for the feature - Character detail.

public final class CharacterDetailKitAssembly {
    
    private let commonUIKit: CommonUIKitAssembly
    private let dataProviders: DataProvidersAssembly
    private let dateFormmater: DateFormatter
    
    public init(commonUIKit: CommonUIKitAssembly,
                dataProviders: DataProvidersAssembly,
                dateFormmater: DateFormatter) {
        self.commonUIKit = commonUIKit
        self.dataProviders = dataProviders
        self.dateFormmater = dateFormmater
    }
    
    public var mainScreen : Screen {
        CharacterDetailScreen(characterDetailContainerViewControllerProvider: self)
    }
    
    func characterDetailContainerPresenter(for characterId: CharacterId) -> CharacterDetailContainerPresenter {
        CharacterDetailContainerPresenter(getCharacterDetail: getCharacterDetail(),
                                          characterId: characterId)
    }
    
    func characterDetailViewControllerFactory() -> CharacterDetailViewControllerFactory {
        CharacterDetailViewControllerFactory(loadingViewControllerProvider: commonUIKit,
                                            retryViewControllerProvider: commonUIKit,
                                            characterDetailViewControllerProvider: self)
    }
    
    func getCharacterDetail() -> GetCharacterDetail {
        GetCharacterDetail(characterRepository: dataProviders.CharactersRepository,
                           schedulerFactory: GCDSchedulerFactory())
    }
    
    func characterDetailPresenter(character: CharacterDetail) -> CharacterDetailPresenter {
        CharacterDetailPresenter(character: character)
    }
}


extension CharacterDetailKitAssembly: CharacterDetailContainerViewControllerProvider {
    func characterDetailContainerViewController(characterId: CharacterId) -> CharacterDetailContainerViewController {
        let bundle = Bundle(for: CharacterDetailContainerViewController.self)
        
        let storyboard = UIStoryboard(name: CharacterDetailContainerViewController.storyboard, bundle: bundle)
        return CharacterDetailContainerViewController.createWith(storyboard: storyboard,
                                                                 characterDetailContainerPresenter: characterDetailContainerPresenter(for: characterId),
                                                                 characterDetailViewControllerFactory: characterDetailViewControllerFactory())
    }
}

extension CharacterDetailKitAssembly: CharacterDetailViewControllerProvider {
    func characterDetailViewController(character: CharacterDetail) -> CharacterDetailViewController {
        CharacterDetailViewController(characterDetailPresenter: characterDetailPresenter(character: character))
    }
}
