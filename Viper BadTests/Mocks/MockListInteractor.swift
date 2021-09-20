//
//  MockListInteractor.swift
//  Viper BadTests
//
//  Created by Marcio Duarte on 2021-09-20.
//

import Foundation
@testable import Viper_Bad

class MockPresenterToInteractorProtocol: PresenterToInteractorProtocol {
    private(set) var getAllCharactersCount = 0
    
    var presenter: InteractorToPresenterProtocol?
    
    func getAllCharacters() {
        getAllCharactersCount += 1
    }
}
