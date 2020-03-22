//
//  CharactersListCell.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import CommonUIKit
import UIKit

final class CharactersListCell: UITableViewCell {
    private let customView = CharacterSummaryView(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        customView.setHighlighted(highlighted)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        // do nothing
    }
}

private extension CharactersListCell {
    enum Constants {
        static let edgeInset = UIEdgeInsets(top: 0, left: 16, bottom: 8, right: 16)
    }
    
    func setUp() {
        contentView.addSubview(customView, constraints: [
            customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.edgeInset.left),
            customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.edgeInset.right),
            customView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.edgeInset.top),
            customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.edgeInset.bottom)
        ])
    }
}

extension CharactersListCell {
    var icon: UIImage? {
        get { return customView.icon }
        set { customView.icon = newValue }
    }
    
    var header: String {
        get { return customView.header }
        set { customView.header = newValue }
    }
    
    var descriptionText: String {
        get { return customView.text }
        set { customView.text = newValue }
    }
}
