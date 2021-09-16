//
//  BreakingBadAPIClient.swift
//  Viper Bad
//
//  Created by Marcio Duarte on 2021-09-16.
//

import Foundation

protocol BreakingBadAPIClient {
    func getAllCharacters(
        handler: @escaping ((Result<[Character], AppError>) -> Void)
    )
}

class BreakingBadAPIClientImpl: BreakingBadAPIClient {
    private var baseURL: String
    
    required init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func getAllCharacters(
        handler: @escaping ((Result<[Character], AppError>) -> Void)) {
        guard var endpoint = URL(string: baseURL) else {
            handler(.failure(.invalidBaseURL))
            return
        }
        
        // build the endpoint URL
        endpoint.appendPathComponent("/characters")
        
        let request = URLRequest(url: endpoint)
        
        // perform the request
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            guard let data = data else {
                // according to apple's documentation if data == nil
                // then error != nil
                handler(.failure(.networkError(cause: error!)))
                return
            }
            
            // parse the response
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                // decode the json response
                let characters = try decoder.decode([Character].self, from: data)
                handler(.success(characters))
            } catch let error {
                handler(.failure(.networkError(cause: error)))
            }
        }.resume()
    }
}
