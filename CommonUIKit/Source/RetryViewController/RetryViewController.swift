//
//  RetryViewController.swift
//  CommonUIKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import UIKit

public protocol RetryViewControllerProvider: AnyObject {
    func retryViewController(title: String,
                             descriptionText: String) -> RetryViewController
}

public class RetryViewController: UIViewController {

    public weak var delegate: RetryViewControllerDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private let titleText: String?
    private let descriptionText: String
    
    public init(title: String,
                descriptionText: String) {
        titleText = title
        self.descriptionText = descriptionText
        
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = titleText
        descriptionLabel.text = descriptionText
    }

    @IBAction func retryButtonTapped(_ sender: Any) {
        delegate?.retryViewDidTapOnButton()
    }
}
