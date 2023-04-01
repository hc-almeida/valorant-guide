//
//  URLSessionProtocol.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 28/12/22.
//

import Foundation

protocol URLSessionProtocol {
    func loadData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: URLSessionProtocol {
    
    func loadData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let dataTask = dataTask(with: request, completionHandler: completionHandler)
        dataTask.resume()
    }
}
