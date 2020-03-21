//
//  CharactersListScreen.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import NavigatorKit
import UIKit

class CharactersListScreen: Screen {
    func viewController(with params: ScreenParams?) -> UIViewController {
        #warning("TODO: WIP")

        let bundle = Bundle(for: CharactersListViewController.self)
        //        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "CharactersList", bundle: bundle)
        
        guard let mainVC = storyboard.instantiateViewController(withIdentifier: "CharactersListViewController") as? CharactersListViewController  else {
            fatalError("Can't create CharactersListViewController from storyboard")
        }
        
        return mainVC
    }
    
    
}
