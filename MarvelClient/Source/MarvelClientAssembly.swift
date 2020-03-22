//
//  MarvelClientAssembly.swift
//  MarvelClient
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

public final class MarvelClientAssembly{
    //This should be in other part
    private enum Constants {
        static let publicKey = "650e801e1408159969078d2a1361c71c"
        static let privateKey = "20112b45612fd05f0d21d80d70bc8c971695c7f1"
    }
    
    public init() {}
    
    public lazy var apiClient : MarvelAPIClient = MarvelAPIClient(publicKey: Constants.publicKey,
                                                             privateKey: Constants.privateKey)
}
