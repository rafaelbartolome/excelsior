//
//  CharactersListContainerViewController.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import UIKit

protocol CharactersListContainerViewControllerProvider: class {
    func charactersListContainerViewController() -> CharactersListContainerViewController
}

class CharactersListContainerViewController: UIViewController {
    static let storyboard = "CharactersListContainer"
    static let viewController = "CharactersListContainerViewController"
    
    private var charactersListContainerPresenter: CharactersListContainerPresenter! {
        didSet {
           charactersListContainerPresenter.view = self
        }
    }
    private var charactersListViewControllerFactory: CharactersListViewControllerFactory!

    static func createWith(storyboard: UIStoryboard,
                           charactersListContainerPresenter: CharactersListContainerPresenter,
                           charactersListViewControllerFactory: CharactersListViewControllerFactory) -> CharactersListContainerViewController {
        guard let charactersListContainerVC = storyboard.instantiateViewController(withIdentifier: CharactersListContainerViewController.viewController) as? CharactersListContainerViewController  else {
            fatalError("Can't create charactersListContainerVC from storyboard")
        }
        
        // setup dependencies
        charactersListContainerVC.charactersListContainerPresenter = charactersListContainerPresenter
        charactersListContainerVC.charactersListViewControllerFactory = charactersListViewControllerFactory
        
        return charactersListContainerVC
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        charactersListContainerPresenter.didLoad()
    }
}

extension CharactersListContainerViewController: CharactersListContainerView {
    func showView(forState state: CharactersListState) {
        let viewController = charactersListViewControllerFactory.viewController(forState: state,
                                                                                loadErrorDelegate: self) //TODO
        #warning("TODO: check if is needed to clear previous vc")
        setContentViewController(viewController, in: view)
    }
}


private extension CharactersListContainerViewController {
    func setContentViewController(_ viewController: UIViewController, in view: UIView) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
}

    
