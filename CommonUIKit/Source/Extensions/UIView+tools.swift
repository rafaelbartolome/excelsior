//
//  UIView+tools.swift
//  CommonUIKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import UIKit
public extension UIView {
    
    // MARK: Autolayout
    
    func constraintsForEdges(to view: UIView, inset: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        [
            topAnchor.constraint(equalTo: view.topAnchor, constant: inset.top),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset.left),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -inset.bottom),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset.right)
        ]
    }
    
    func addSubview(_ subview: UIView, constraints: [NSLayoutConstraint]) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate(constraints)
    }
}
