//
//  CharactersListViewController.swift
//  CharactersListKit
//
//  Created by Rafael Bartolome on 22/03/2020.
//  Copyright © 2020 Rafael Bartolome. All rights reserved.
//

import Foundation
import UIKit
import CommonUIKit

protocol CharactersListViewControllerProvider: AnyObject {
    func charactersListViewController(characters: [CharacterListModel]) -> CharactersListViewController
}

/// CharactersListViewController is the view controller that representes the view in state loaded with the right data
final class CharactersListViewController: UITableViewController {
    private enum Constants {
        static let numberSections = 1
        static let rowHeight = CGFloat(64)
    }
    
    // Dependencies
    
    private let presenter: CharactersListPresenter
    
    init(charactersListPresenter: CharactersListPresenter) {
        presenter = charactersListPresenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        Constants.numberSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfCharacters
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CharactersListCell.dequeueReusableCell(for: indexPath, from: tableView)
        let character = presenter.character(for: indexPath.row)
        #warning("TODO: WIP bind cell")

        cell.header = character.name
        cell.descriptionText = character.bio
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.characterSelected(at: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        false
    }
}

private extension CharactersListViewController {
    func setUp() {
        CharactersListCell.register(on: tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = Constants.rowHeight
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .automatic
    }
}
