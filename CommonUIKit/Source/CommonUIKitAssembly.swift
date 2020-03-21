//
//  CommonUIKitAssembly.swift
//  CommonUIKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation

public class CommonUIKitAssembly {
    public init() {}
}

extension CommonUIKitAssembly: LoadingViewControllerProvider {
    public func loadingViewController(detailText: String) -> LoadingViewController {
        LoadingViewController(detailText: detailText)
    }
}

extension CommonUIKitAssembly: RetryViewControllerProvider {
    public func retryViewController(title: String, descriptionText: String) -> RetryViewController {
        RetryViewController(title: title, descriptionText: descriptionText)
    }
}
