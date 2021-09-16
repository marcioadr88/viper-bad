//
//  ViewController.swift
//  Viper Bad
//
//  Created by Marcio Duarte on 2021-09-14.
//

import UIKit

class CharactersListViewController: UIViewController, PresenterToViewProtocol {
    var presenter: ViewToPresenterProtocol?

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    private var characters = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = NSLocalizedString("Breaking Viper", comment: "App title")
        
        presenter?.getAllCharacters()
    }

    func showCharacters(characters: [Character]) {
        updateCharactersTableView(with: characters)
    }
    
    func showError(message: String) {
        updateCharactersTableView(with: [])
        
        let alertController = AlertUtils.buildAlertController(title: NSLocalizedString("An error ocurred", comment: ""), message: message)
        present(alertController, animated: true, completion: nil)
    }
    
    private func updateCharactersTableView(with characters: [Character]) {
        self.characters = characters
        tableView.reloadData()
    }
}

extension CharactersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharactersListViewController.reuseCellId) else {
            return UITableViewCell()
        }
        
        let character = self.characters[indexPath.row]
        
        cell.textLabel?.text = character.name
        
        return cell
    }
}

extension CharactersListViewController {
    private static let reuseCellId = "CharacterCell"
}
