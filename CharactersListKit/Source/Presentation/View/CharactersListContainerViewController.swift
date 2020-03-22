//
//  CharactersListContainerViewController.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import UIKit
import CommonUIKit

protocol CharactersListContainerViewControllerProvider: class {
    func charactersListContainerViewController() -> CharactersListContainerViewController
}

/// CharactersListContainerViewController is the container for all possible list states (loading, loaded or error)
/// Each list state is representer in a diferent view controller that is presented as a child view controller.
class CharactersListContainerViewController: UIViewController {
    static let storyboard = "CharactersListContainer"
    static let viewController = "CharactersListContainerViewController"
    
    private var childViewController: UIViewController?
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension CharactersListContainerViewController: CharactersListContainerView {
    func showView(forState state: CharactersListState) {
        let viewController = charactersListViewControllerFactory.viewController(forState: state)
        setContentViewController(viewController,
                                 in: view,
                                 withPreviousViewControler: childViewController)
        childViewController = viewController
    }
}    
