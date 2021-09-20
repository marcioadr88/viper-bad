//
//  MockListView.swift
//  Viper BadTests
//
//  Created by Marcio Duarte on 2021-09-20.
//

import Foundation
@testable import Viper_Bad

class MockPresenterToViewProtocol: PresenterToViewProtocol {
    var presenter: ViewToPresenterProtocol?
    
    private(set) var characters = [Character]()
    private(set) var errorMessage: String?
    private(set) var countShowCharacters = 0
    private(set) var countShowError = 0
    
    func showCharacters(characters: [Character]) {
        self.characters = characters
        countShowCharacters += 1
    }
    
    func showError(message: String) {
        errorMessage = message
        countShowError += 1
    }
}
