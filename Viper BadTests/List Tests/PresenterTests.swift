//
//  PresenterTests.swift
//  Viper BadTests
//
//  Created by Marcio Duarte on 2021-09-20.
//

import XCTest
@testable import Viper_Bad

class PresenterTests: XCTestCase {
    private var view: MockPresenterToViewProtocol!
    private var presenter: CharactersListPresenter!
    private var interactor: MockPresenterToInteractorProtocol!
    
    override func setUp() {
        view = MockPresenterToViewProtocol()
        interactor = MockPresenterToInteractorProtocol()
        
        presenter = CharactersListPresenter()
        presenter.view = view
        presenter.interactor = interactor
    }
    
    
    func testGetAllCharacters() throws {
        presenter.getAllCharacters()
        
        XCTAssertEqual(interactor.getAllCharactersCount, 1)
    }
    
    func testGetAllCharactersSuccess() throws {
        presenter.getAllCharactersSuccess(characters: testCharactersList)
        
        XCTAssertEqual(view.countShowCharacters, 1, "Expect showCharacters called once")
        XCTAssertEqual(view.characters, testCharactersList, "The returned character list is not equal")
    }
    
    func testGetAllCharactersError() throws {
        presenter.getAllCharactersError(error: testAppError)
        
        XCTAssertEqual(view.countShowError, 1, "Expect showError called once")
        XCTAssertEqual(view.errorMessage, testAppError.localizedDescription, "The error message is not equal")
    }
}
