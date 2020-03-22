//
//  CharacterRepositoryError.swift
//  Models
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import MarvelClient

public enum CharacterRepositoryError: Error {
    case notFound
    case marvelError(code: Int, message: String)
    case unknow(Error)
}

extension CharacterRepositoryError {
    init(withResponseError error: Error) {
        switch error {
        case let marvelAPIError as MarvelError:
            switch marvelAPIError {
            case let .server(code, message):
                self = .marvelError(code: code, message: message)
            default:
                self = .unknow(error)
            }
        default:
            self = .unknow(error)
        }
    }
}

