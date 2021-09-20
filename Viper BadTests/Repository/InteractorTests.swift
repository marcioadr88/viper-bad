//
//  InteractorTests.swift
//  Viper BadTests
//
//  Created by Marcio Duarte on 2021-09-20.
//

import XCTest
@testable import Viper_Bad

class InteractorTests: XCTestCase {
    private var interactor: CharactersListInteractor!
    private var failureInteractor: CharactersListInteractor!
    
    private var presenter: MockInteractorToPresenterProtocol!
    private var failurePresenter: MockInteractorToPresenterProtocol!
    
    override func setUp() {
        let apiRepository = MockBreakingBadAPIRepository(apiClient: MockBreakingBadAPIClient())
        interactor = CharactersListInteractor(repository: apiRepository)
        presenter = MockInteractorToPresenterProtocol()
        interactor.presenter = presenter
        
        let failureApiRepository = MockBreakingBadAPIRepository(apiClient: FailureBreakingBadAPIClient())
        failureInteractor = CharactersListInteractor(repository: failureApiRepository)
        failurePresenter = MockInteractorToPresenterProtocol()
        failureInteractor.presenter = failurePresenter
    }
    
    func testGetAllCharactersSuccess() throws {
        interactor.getAllCharacters()
        
        XCTAssertEqual(presenter.getAllCharactersSuccessCount, 1, "Expect getAllCharactersSuccess called once")
        XCTAssertEqual(presenter.characters?.count, mockCharactersList.count, "Ouput doesn't contain expected elements count")
    }
    
    func testGetAllCharactersFailure() throws {
        failureInteractor.getAllCharacters()
        
        XCTAssertEqual(failurePresenter.getAllCharactersErrorCount, 1, "Expect getAllCharactersError called once")
        XCTAssertNotNil(failurePresenter.error, "Expect error not nil")
    }
}
