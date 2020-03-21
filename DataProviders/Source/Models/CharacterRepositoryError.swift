//
//  CharacterRepositoryError.swift
//  Models
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

public enum CharacterRepositoryError: Error {
    case notFound
    case marvelError(code: String, message: String)
    case unknow(Error)
}


