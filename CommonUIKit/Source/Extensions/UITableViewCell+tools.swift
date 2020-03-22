//
//  UITableViewCell+tools.swift
//  CommonUIKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import UIKit

public extension UITableViewCell {
    class func register(on tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: cellReuseIdentifier())
    }
    
    class func dequeueReusableCell(for indexPath: IndexPath, from tableView: UITableView) -> Self {
        internalDequeueReusableCell(for: indexPath, from: tableView, identifier: cellReuseIdentifier())
    }
}

private extension UITableViewCell {
    class func cellReuseIdentifier() -> String {
        NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    class func internalDequeueReusableCell<T>(for indexPath: IndexPath, from tableView: UITableView, identifier: String) -> T where T: UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Nib cell class does not match expected cell class \(identifier).")
        }
        
        return cell
    }
}
