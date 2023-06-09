//
//  Network.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 28/12/22.
//

import Foundation

typealias NetworkResult<T: Decodable> = ((Result<T, Error>) -> Void)

protocol NetworkManagerProtocol {
    func request<T: Decodable>(_ request: NetworkRequest, completion: @escaping NetworkResult<T>)
}

final class NetworkManager: NetworkManagerProtocol {
    
    // MARK: - Private Properties
    
    private let urlSession: URLSessionProtocol
    
    // MARK: - Init
    
    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    // MARK: - Public Functions
    
    func request<T>(_ request: NetworkRequest, completion: @escaping NetworkResult<T>) {
        guard let url = URL(string: request.urlString) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod.rawValue
        
        urlSession.loadData(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(APIError.unexpectedStatusCode))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
                
            } catch {
                completion(.failure(APIError.decodeError))
            }
        }
    }
}
