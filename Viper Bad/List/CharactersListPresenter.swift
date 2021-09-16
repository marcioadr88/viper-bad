//
//  ListPresenter.swift
//  Viper Bad
//
//  Created by Marcio Duarte on 2021-09-15.
//

import Foundation

class CharactersListPresenter: ViewToPresenterProtocol {
    weak var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func getAllCharacters() {
        interactor?.getAllCharacters()
    }
}

extension CharactersListPresenter: InteractorToPresenterProtocol {
    func getAllCharactersSuccess(characters: [Character]) {
        view?.showCharacters(characters: characters)
    }
    
    func getAllCharactersError(error: AppError) {
        view?.showError(message: error.localizedDescription)
    }
}
