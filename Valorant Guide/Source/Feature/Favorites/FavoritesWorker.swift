//
//  FavoritesWorker.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 20/01/23.
//

import Foundation

protocol FavoritesWorkerLogic {
    func fetchFavoriteAgents(completion: @escaping (Result<[FavoriteAgent], APIError>) -> Void)
    func deleteFavoriteAgent(id: String?, completion: @escaping((Result<Bool, APIError>) -> Void))
}

final class FavoritesWorker: FavoritesWorkerLogic {
    
    func fetchFavoriteAgents(completion: @escaping (Result<[FavoriteAgent], APIError>) -> Void) {
        FavoriteAgentRepository.shared.fetch { result in
            completion(result)
        }
    }
    
    func deleteFavoriteAgent(id: String?, completion: @escaping((Result<Bool, APIError>) -> Void)) {
        FavoriteAgentRepository.shared.delete(id: id) { result in
            switch result {
            case .success(_):
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
