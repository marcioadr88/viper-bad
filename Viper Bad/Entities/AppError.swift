//
//  AppError.swift
//  Viper Bad
//
//  Created by Marcio Duarte on 2021-09-15.
//

import Foundation

/// Represents an exception on the app
enum AppError: Error {
    /// The provided base url is not valid
    case invalidBaseURL
    
    /// The provided endpoint path is not valid
    case invalidEndpoindURL
     
    /// An network error ocurrs
    case networkError(cause: Error)
    
    /// Cannot parse the Post
    case decodingError(cause: Error)
    
    /// DB Error
    case databaseError(cause: Error)
    
    /// Api returned an error
    case apiError(message: String)
}

/// Provides an user friendly error message
extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidBaseURL:
            return NSLocalizedString("The provided base url is not valid", comment: "")
        case .invalidEndpoindURL:
            return NSLocalizedString("The provided endpoint path is not valid", comment: "")
        case .networkError(let cause):
            return cause.localizedDescription
        case .decodingError(let cause):
            return cause.localizedDescription
        case .databaseError(let cause):
            return cause.localizedDescription
        case .apiError(let message):
            return message
        }
    }
}

extension AppError: Equatable {
    static func ==(lhs: AppError, rhs: AppError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidBaseURL, .invalidBaseURL):
            return true
        case (.invalidEndpoindURL, .invalidEndpoindURL):
            return true
        case (let .networkError(lhsCause), let .networkError(rhsCause)):
            return lhsCause.localizedDescription == rhsCause.localizedDescription
        case (let .decodingError(lhsCause), let .decodingError(rhsCause)):
            return lhsCause.localizedDescription == rhsCause.localizedDescription
        case (let .databaseError(lhsCause), let .databaseError(rhsCause)):
            return lhsCause.localizedDescription == rhsCause.localizedDescription
        case (let .apiError(lhsMessage), let .apiError(rhsMessage)):
            return lhsMessage == rhsMessage
        default:
            return false
        }
    }
}
