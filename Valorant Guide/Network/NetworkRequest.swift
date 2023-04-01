//
//  NetworkRequest.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 28/12/22.
//

import Foundation

protocol NetworkRequest {
    var urlString: String { get }
    var httpMethod: HTTPMethod { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
