//
//  MockBreakingBadRepository.swift
//  Viper BadTests
//
//  Created by Marcio Duarte on 2021-09-16.
//

import Foundation
@testable import Viper_Bad

class MockBreakingBadAPIRepository: BreakingBadRepository {
    let apiClient: BreakingBadAPIClient
    
    init(apiClient: BreakingBadAPIClient) {
        self.apiClient = apiClient
    }
    
    func getAllCharacters(completionHandler: @escaping ((Result<[Character], AppError>) -> Void)) {
        apiClient.getAllCharacters(handler: completionHandler)
    }
}
