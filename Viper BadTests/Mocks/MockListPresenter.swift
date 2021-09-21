//
//  MockListPresenter.swift
//  Viper BadTests
//
//  Created by Marcio Duarte on 2021-09-20.
//

import Foundation
@testable import Viper_Bad

class MockInteractorToPresenterProtocol: InteractorToPresenterProtocol {
    private(set) var characters: [Character]?
    private(set) var error: AppError?
    
    private(set) var getAllCharactersSuccessCount = 0
    private(set) var getAllCharactersErrorCount = 0
    
    func getAllCharactersSuccess(characters: [Character]) {
        self.characters = characters
        getAllCharactersSuccessCount += 1
    }
    
    func getAllCharactersError(error: AppError) {
        self.error = error
        getAllCharactersErrorCount += 1
    }
}

class MockViewToPresenterProtocol: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    private(set) var countGetAllCharacters = 0
    
    func getAllCharacters() {
        countGetAllCharacters += 1
    }
}


