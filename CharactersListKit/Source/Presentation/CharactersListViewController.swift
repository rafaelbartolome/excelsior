//
//  CharactersListViewController.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import UIKit

protocol CharactersListViewControllerProvider: class {
    func charactersListViewController() -> CharactersListViewController
}

class CharactersListViewController: UIViewController {
    static let storyboard = "CharactersList"
    static let viewController = "CharactersListViewController"
    
    private var charactersListPresenter: CharactersListPresenter! {
        didSet {
            #warning("TODO: WIP")
//            charactersListPresenter.view = self
        }
    }

    static func createWith(storyboard: UIStoryboard,
                           charactersListPresenter: CharactersListPresenter) -> CharactersListViewController {
        guard let charactersListVC = storyboard.instantiateViewController(withIdentifier: CharactersListViewController.viewController) as? CharactersListViewController  else {
            fatalError("Can't create charactersListVC from storyboard")
        }
        
        // setup dependencies
        charactersListVC.charactersListPresenter = charactersListPresenter

        
        return charactersListVC
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
