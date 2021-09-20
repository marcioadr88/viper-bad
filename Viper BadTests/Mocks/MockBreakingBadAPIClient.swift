//
//  MockBreakingBadAPIClient.swift
//  Viper BadTests
//
//  Created by Marcio Duarte on 2021-09-16.
//

import Foundation
@testable import Viper_Bad

class MockBreakingBadAPIClient: BreakingBadAPIClient {
    func getAllCharacters(handler: @escaping ((Result<[Character], AppError>) -> Void)) {
        handler(Result.success(testCharactersList))
    }
}

class EmptyBreakingBadAPIClient: BreakingBadAPIClient {
    func getAllCharacters(handler: @escaping ((Result<[Character], AppError>) -> Void)) {
        handler(Result.success([]))
    }
}

class FailureBreakingBadAPIClient: BreakingBadAPIClient {
    func getAllCharacters(handler: @escaping ((Result<[Character], AppError>) -> Void)) {
        handler(Result.failure(testAppError))
    }
}
