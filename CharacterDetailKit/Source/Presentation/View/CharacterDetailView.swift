//
//  CharacterDetailView.swift
//  CharacterDetailKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

protocol CharacterDetailView: AnyObject{
    func setUpName(_ name: String)
    func setUpBio(_ bio: String)
    func setUpImage(_ url: URL?)
}
