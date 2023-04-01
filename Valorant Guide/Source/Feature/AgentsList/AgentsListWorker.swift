//
//  AgentsListWorker.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 28/12/22.
//

import Foundation

protocol AgentsListWorkerLogic {
    func fetchAgentsList(completion: @escaping (Result<AgentsListModel.Response, Error>) -> Void)
    func createFavoriteAgent(character: FavoriteAgent, completion: @escaping((Result<Bool, APIError>) -> Void))
    func loadFavoriteAgents(completion: @escaping (Result<[FavoriteAgent], APIError>) -> Void)
}

final class AgentsListWorker {
    
    private let network: NetworkManagerProtocol
    
    init(network: NetworkManagerProtocol = NetworkManager()) {
        self.network = network
    }
}

// MARK: - AgentsListWorkerLogic

extension AgentsListWorker: AgentsListWorkerLogic {

    func fetchAgentsList(completion: @escaping (Result<AgentsListModel.Response, Error>) -> Void) {
        let request = AgentsListModel.Request.init()
        
        network.request(request) { (result: Result<AgentsListModel.Response, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    debugPrint("❌ - ERROR \(error)")
                    completion(.failure(error))
                }
            }
        }
    }
    
    func createFavoriteAgent(character: FavoriteAgent, completion: @escaping ((Result<Bool, APIError>) -> Void)) {
        FavoriteAgentRepository.shared.create { result in
            switch result {
            case .success(_):
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loadFavoriteAgents(completion: @escaping (Result<[FavoriteAgent], APIError>) -> Void) {
        FavoriteAgentRepository.shared.fetch { result in
            completion(result)
        }
    }
}
