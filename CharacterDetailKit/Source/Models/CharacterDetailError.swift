//
//  CharacterDetailError.swift
//  CharacterDetailKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import DataProviders

enum CharacterDetailError: Error {
    case notFound
    case marvelError(String)
    case unknow(Error)
}

/// Mapper between data providers domain and presentation domain
extension CharacterDetailError {
    init(characterRepositoryError: CharacterRepositoryError) {
        switch characterRepositoryError{
        case .notFound:
            self = .notFound
        case let .marvelError(_, message):
            self  = .marvelError(message)
        case .unknow(let error):
            self = .unknow(error)
        }
    }
}

extension CharacterDetailError {
    public var localizedDescription: String {
        //TODO: localization
        switch self {
        case .notFound:
            return "Character not found."
        case .marvelError(let message):
            return message
        case .unknow:
            return "Something was wrong, please try again."
        }
    }
}
