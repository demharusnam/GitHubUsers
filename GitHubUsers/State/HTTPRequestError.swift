//
//  HTTPRequestError.swift
//  HTTPRequestError
//
//  Created by Mansur Ahmed on 2021-08-27.
//

import Foundation

enum HTTPRequestError: Error {
    case badResponse
    case decodeError
    case invalidURL
    case exceededAPILimit
    case noInternetConnection
}

extension HTTPRequestError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badResponse:
            return "Bad response from URL request"
        case .decodeError:
            return "Unable to decode response"
        case .invalidURL:
            return "Invalid url created"
        case .exceededAPILimit:
            return "Exceeded API request limit"
        case .noInternetConnection:
            return "Request timed out"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .exceededAPILimit:
            return "You are only allowed to make 10 search requests every minute."
        case .noInternetConnection:
            return "Internet connection failure."
        default:
            return "Unknown reason."
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .exceededAPILimit:
            return "Please try again in one minute."
        case .noInternetConnection:
            return "Please ensure you have a stable internet connection."
        default:
            return "Please try again."
        }
    }
}
