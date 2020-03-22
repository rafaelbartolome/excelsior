//
//  CharacterDetailViewController.swift
//  CharacterDetailKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import UIKit

protocol CharacterDetailViewControllerProvider: AnyObject {
    func characterDetailViewController(character: CharacterDetail) -> CharacterDetailViewController
}

class CharacterDetailViewController: UIViewController {

   // Dependencies
    
    private let presenter: CharacterDetailPresenter
    

    init(characterDetailPresenter: CharacterDetailPresenter) {
        presenter = characterDetailPresenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}
