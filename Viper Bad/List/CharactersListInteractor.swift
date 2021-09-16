//
//  ListInteractor.swift
//  Viper Bad
//
//  Created by Marcio Duarte on 2021-09-15.
//

import Foundation

class CharactersListInteractor: PresenterToInteractorProtocol {
    weak var presenter: InteractorToPresenterProtocol?
    let repository: BreakingBadRepository
    
    init(repository: BreakingBadRepository) {
        self.repository = repository
    }
    
    func getAllCharacters() {
        repository.getAllCharacters { [weak self] result in
            switch result {
            case .success(let characters):
                self?.presenter?.getAllCharactersSuccess(characters: characters)
            case .failure(let error):
                self?.presenter?.getAllCharactersError(error: error)
            }
        }
    }
}
