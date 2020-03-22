//
//  CharacterListError.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import DataProviders

enum CharacterListError: Error {
    case notFound
    case marvelError(String)
    case unknow(Error)
}

extension CharacterListError: Equatable {
    static func == (lhs: CharacterListError, rhs: CharacterListError) -> Bool {
        switch (lhs, rhs) {
        case (.notFound, .notFound):
            return true
        case (.marvelError(let lError), .marvelError(let rError)):
            return lError == rError
        case (.unknow, .unknow):
            return true
        default:
            return false
        }
    }
}

/// Mapper between data providers domain and presentation domain
extension CharacterListError {
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

extension CharacterListError {
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
