//
//  RepositoryTest.swift
//  Viper BadTests
//
//  Created by Marcio Duarte on 2021-09-16.
//

import XCTest
@testable import Viper_Bad

class RepositoryTests: XCTestCase {
    var apiClient: BreakingBadAPIClient?
    var emptyApiClient: BreakingBadAPIClient?
    var failureApiClient: BreakingBadAPIClient?
    
    var apiRepository: BreakingBadRepository?
    var emptyApiRepository: BreakingBadRepository?
    var failureApiRepository: BreakingBadRepository?
    
    override func setUp() {
        apiClient = MockBreakingBadAPIClient()
        emptyApiClient = EmptyBreakingBadAPIClient()
        failureApiClient = FailureBreakingBadAPIClient()
        
        apiRepository = BreakingBadNetworkRepository(apiClient: apiClient!)
        emptyApiRepository = BreakingBadNetworkRepository(apiClient: emptyApiClient!)
        failureApiRepository = BreakingBadNetworkRepository(apiClient: failureApiClient!)
    }
    
    override func tearDown() {}

    func testNotEmptyApiClient() {
        apiClient?.getAllCharacters { result in
            guard case let .success(characters) = result else {
                XCTFail("ApiClient result is failure")
                return
            }
            
            XCTAssertTrue(!characters.isEmpty, "Characters result is empty")
            XCTAssertTrue(characters.count == mockCharactersList.count, "The returned character list is not equal")
        }
    }
    
    func testEmptyApiClient() {
        emptyApiClient?.getAllCharacters { result in
            guard case let .success(characters) = result else {
                XCTFail("ApiClient result is failure")
                return
            }
            
            XCTAssertTrue(characters.isEmpty, "Characters result is not empty")
        }
    }
    
    func testFailureApiClient() {
        failureApiClient?.getAllCharacters { result in
            guard case .failure(_) = result else {
                XCTFail("ApiClient result is not failure")
                return
            }
        }
    }
    
    func testNotEmptyRepository() {
        apiRepository?.getAllCharacters { result in
            guard case let .success(characters) = result else {
                XCTFail("ApiRepository result is failure")
                return
            }
            
            XCTAssertTrue(!characters.isEmpty, "Characters result is empty")
            XCTAssertTrue(characters.count == mockCharactersList.count, "The returned character list is not equal")
        }
    }
    
    func testEmptyRepository() {
        emptyApiRepository?.getAllCharacters { result in
            guard case let .success(characters) = result else {
                XCTFail("ApiRepository result is failure")
                return
            }
            
            XCTAssertTrue(characters.isEmpty, "Characters result is not empty")
        }
    }
    
    func testFailureRepository() {
        failureApiRepository?.getAllCharacters { result in
            guard case .failure(_) = result else {
                XCTFail("ApiRepository result is not failure")
                return
            }
        }
    }
}
