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
            #warning("TODO: WIP")
//            charactersListPresenter.view = self
        }
    }

    static func createWith(storyboard: UIStoryboard,
                           charactersListContainerPresenter: CharactersListContainerPresenter) -> CharactersListContainerViewController {
        guard let charactersListContainerVC = storyboard.instantiateViewController(withIdentifier: CharactersListContainerViewController.viewController) as? CharactersListContainerViewController  else {
            fatalError("Can't create charactersListContainerVC from storyboard")
        }
        
        // setup dependencies
        charactersListContainerVC.charactersListContainerPresenter = charactersListContainerPresenter

        
        return charactersListContainerVC
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
