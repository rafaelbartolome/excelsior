//
//  LoadingViewController.swift
//  CommonUIKit
//
//  Created by Rafael Bartolome on 21/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import UIKit

public protocol LoadingViewControllerProvider: AnyObject {
    func loadingViewController(detailText: String) -> LoadingViewController
}


public class LoadingViewController: UIViewController {
    
    private let detailText: String?
    @IBOutlet weak var detailLabel: UILabel!
    
    // MARK: - Initialization
    
    public init(detailText: String) {
        self.detailText = detailText
        super.init(nibName: "LoadingViewController", bundle: Bundle(for: LoadingViewController.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        detailLabel.text = detailText
    }
}
