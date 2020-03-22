//
//  CharacterDetailViewController.swift
//  CharacterDetailKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import UIKit
import Kingfisher

protocol CharacterDetailViewControllerProvider: AnyObject {
    func characterDetailViewController(character: CharacterDetail) -> CharacterDetailViewController
}

class CharacterDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    // Dependencies
    
    private let presenter: CharacterDetailPresenter

    init(characterDetailPresenter: CharacterDetailPresenter) {
        presenter = characterDetailPresenter
        super.init(nibName: "CharacterDetailViewController", bundle: Bundle(for: CharacterDetailViewController.self))
        presenter.view = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.didLoad()
    }
}

extension CharacterDetailViewController: CharacterDetailView {
    func setUpName(_ name: String) {
        nameLabel.text = name
    }
    
    func setUpBio(_ bio: String) {
        bioLabel.text = bio
    }
    
    func setUpImage(_ url: URL?) {       
        let placeholder = UIImage(named: "detail-placeholder",
                                  in: Bundle(for: CharacterDetailViewController.self),
                                  compatibleWith: nil)
        if let imageURL = url {
            imageView.kf.setImage(with: imageURL,
                                  placeholder: placeholder)
        } else {
            imageView.image = placeholder
        }
    }
}
