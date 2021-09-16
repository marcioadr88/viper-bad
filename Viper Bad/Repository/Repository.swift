//
//  Repository.swift
//  Viper Bad
//
//  Created by Marcio Duarte on 2021-09-15.
//

import Foundation

protocol BreakingBadRepository {
    func getAllCharacters(
        completionHandler: @escaping ((Result<[Character], AppError>) -> Void)
    )
}

// https://breakingbadapi.com/documentation

class BreakingBadNetworkRepository: BreakingBadRepository {
    var apiClient: BreakingBadAPIClient
    
    init(apiClient: BreakingBadAPIClient) {
        self.apiClient = apiClient
    }
    
    func getAllCharacters(
        completionHandler: @escaping ((Result<[Character], AppError>) -> Void)
    ) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.apiClient.getAllCharacters { result in
                DispatchQueue.main.async {
                    completionHandler(result)
                }
            }
        }
    }
}
