//
//  APIError.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 28/12/22.
//

import Foundation

enum APIError: Error {
    case unexpectedStatusCode
    case invalidData
    case decodeError
    case invalidURL
    case database
}

extension APIError: LocalizedError {
    
    private var errorDescription: String {
        switch self {
        case .decodeError:
            return "Ocorreu um erro com decode dos dados"
        case .invalidData:
            return "Ocorreu um erro com os dados"
        case .invalidURL:
            return "Ocorreu um erro com a url"
        case .unexpectedStatusCode:
            return "Ocorreu um erro com o status code"
        case .database:
            return "Ocorreu um erro com o banco de dados"
        }
    }
}
