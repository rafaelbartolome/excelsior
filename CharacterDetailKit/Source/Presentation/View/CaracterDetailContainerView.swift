//
//  CaracterDetailContainerView.swift
//  CharacterDetailKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

protocol CharacterDetailContainerView: AnyObject {
    func showView(forState state: CharacterDetailState)
}
