//
//  CharacterSummaryView.swift
//  CommonUIKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import UIKit

/// A view that displays a character summary.
public final class CharacterSummaryView: UIView {
    // MARK: - Properties
    
    public var icon: UIImageView {
        get { return iconView }
    }
    
    public var header: String {
        get { return headerLabel.text ?? "" }
        set { headerLabel.text = newValue }
    }
    
    public var text: String {
        get { return textLabel.text ?? "" }
        set { textLabel.text = newValue }
    }
   
    public func setHighlighted(_ highlighted: Bool) {
        layer.borderColor = highlighted ? UIColor.red.cgColor : UIColor.darkGray.cgColor
    }
    
    private let contentView = UIStackView()
    private let iconView = UIImageView()
    private let headerLabel = UILabel()
    private let textLabel = UILabel()
    private let accessoryImageView = UIImageView(image: UIImage(named: "icn_arrow_right",
                                                                in: Bundle(for: CharacterSummaryView.self),
                                                                compatibleWith: nil))
    
    // MARK: - Initialization
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CharacterSummaryView {
    private enum Constants {
        static let cornerRadius: CGFloat = 6
        static let contentSpacing: CGFloat = 24
        static let contentInset = UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 16)
        static let iconSize = CGSize(width: 80, height: 80)
        static let textSpacing: CGFloat = 8
        static let borderWidth: CGFloat = 1
    }

    func setUp() {
        backgroundColor = .white
        layer.cornerRadius = Constants.cornerRadius
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1
        
        setUpContent()
        setUpIcon()
        setUpText()
        setUpAccessory()
    }
    
    func setUpContent() {
        contentView.alignment = .center
        contentView.spacing = Constants.contentSpacing
        contentView.isLayoutMarginsRelativeArrangement = true
        contentView.layoutMargins = Constants.contentInset
        contentView.distribution = .fillProportionally
        
        addSubview(contentView, constraints: contentView.constraintsForEdges(to: self))
    }
    
    func setUpIcon() {
        iconView.setContentHuggingPriority(.required, for: .horizontal)
        iconView.setContentCompressionResistancePriority(.required, for: .horizontal)
        let iconViewConstraints = [
            iconView.widthAnchor.constraint(equalToConstant: Constants.iconSize.width),
            iconView.heightAnchor.constraint(equalToConstant: Constants.iconSize.height)
        ]
        NSLayoutConstraint.activate(iconViewConstraints)
        iconView.contentMode = .scaleAspectFill
        iconView.layer.cornerRadius = Constants.cornerRadius
        iconView.clipsToBounds = true
        iconView.layer.borderWidth = Constants.borderWidth
        iconView.layer.borderColor = UIColor.lightGray.cgColor

        contentView.addArrangedSubview(iconView)
    }
    
    func setUpText() {
        headerLabel.textColor = .black
        headerLabel.numberOfLines = 1
        headerLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        
        textLabel.textColor = .darkGray
        textLabel.numberOfLines = 0
        textLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        
        let textContentView = UIStackView(arrangedSubviews: [headerLabel, textLabel])
        textContentView.axis = .vertical
        textContentView.spacing = Constants.textSpacing
        textContentView.alignment = .leading
        textContentView.distribution = .fillProportionally
        
        contentView.addArrangedSubview(textContentView)
    }
    
    func setUpAccessory() {
        contentView.addArrangedSubview(accessoryImageView)
        accessoryImageView.tintColor = .black
        accessoryImageView.setContentHuggingPriority(.required, for: .horizontal)
        accessoryImageView.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
}
