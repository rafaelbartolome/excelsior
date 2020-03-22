//
//  CharacterDetailContainerViewController.swift
//  CharacterDetailKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import UIKit

protocol CharacterDetailContainerViewControllerProvider: class {
    func characterDetailContainerViewController(characterId: CharacterId) -> CharacterDetailContainerViewController
}

/// CharacterDetailContainerViewController is the container for all possible character states (loading, loaded or error)
/// Each view state is representer in a different view controller that is presented as a child view controller.
class CharacterDetailContainerViewController: UIViewController {
    static let storyboard = "CharacterDetailContainer"
    static let viewController = "CharacterDetailContainerViewController"
    
    private var childViewController: UIViewController?
    
    private var characterDetailContainerPresenter: CharacterDetailContainerPresenter! {
        didSet {
            characterDetailContainerPresenter.view = self
        }
    }
    private var characterDetailViewControllerFactory: CharacterDetailViewControllerFactory!
    
    static func createWith(storyboard: UIStoryboard,
                           characterDetailContainerPresenter: CharacterDetailContainerPresenter,
                           characterDetailViewControllerFactory: CharacterDetailViewControllerFactory) -> CharacterDetailContainerViewController {
        guard let characterDetailContainerVC = storyboard.instantiateViewController(withIdentifier: CharacterDetailContainerViewController.viewController) as? CharacterDetailContainerViewController  else {
            fatalError("Can't create characterDetailContainerVC from storyboard")
        }
        
        // setup dependencies
        characterDetailContainerVC.characterDetailContainerPresenter = characterDetailContainerPresenter
        characterDetailContainerVC.characterDetailViewControllerFactory = characterDetailViewControllerFactory
        
        return characterDetailContainerVC
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterDetailContainerPresenter.didLoad()
    }
}

extension CharacterDetailContainerViewController: CharacterDetailContainerView {
    func showView(forState state: CharacterDetailState) {
        let viewController = characterDetailViewControllerFactory.viewController(forState: state)
        setContentViewController(viewController, in: view)
    }
}

private extension CharacterDetailContainerViewController {
    func setContentViewController(_ viewController: UIViewController, in view: UIView) {
        if let childVC = childViewController {
            childVC.willMove(toParent: nil)
            childVC.view.removeFromSuperview()
            childVC.removeFromParent()
        }
        
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
        childViewController = viewController
    }
}


