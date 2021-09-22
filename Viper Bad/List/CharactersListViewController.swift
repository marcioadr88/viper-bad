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
        
        navigationItem.title = NSLocalizedString("Viper Bad", comment: "App title")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = character.name
        
        cell.contentConfiguration = contentConfiguration
        
        return cell
    }
}

extension CharactersListViewController {
    static func instantiate() -> CharactersListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as? CharactersListViewController else {
            fatalError(NSLocalizedString("Cannot initialize CharactersListViewController", comment: ""))
        }
        
        return viewController
    }
}

extension CharactersListViewController {
    private static let reuseCellId = "CharacterCell"
    private static let storyboardIdentifier = "CharactersListViewController"
}
