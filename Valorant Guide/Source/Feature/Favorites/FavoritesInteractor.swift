//
//  FavoritesInteractor.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 20/01/23.
//

import Foundation

protocol FavoritesBusinessLogic {
    func fetchFavoriteAgentsList()
    func deleteFavoriteAgent(id: String?)
}

final class FavoritesInteractor {
    
    private var presenter: FavoritesPresentationLogic?
    private var worker: FavoritesWorkerLogic?
    
    init(presenter: FavoritesPresentationLogic, worker: FavoritesWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

// MARK: - FavoritesBusinessLogic

extension FavoritesInteractor: FavoritesBusinessLogic {
    
    func fetchFavoriteAgentsList() {
        worker?.fetchFavoriteAgents(completion: { [weak self] result in
            switch result {
            case .success(let agents):
                self?.presenter?.presentFavoriteAgents(response: .init(agents: agents))
            case .failure(let error):
                self?.presenter?.presentErrorMessage(response: .init(error: error))
            }
        })
    }
    
    func deleteFavoriteAgent(id: String?) {
        guard let id = id else { return }
    
        worker?.deleteFavoriteAgent(id: id, completion: { [weak self] result in
            switch result {
            case .success(_):
               break
            case .failure(let error):
                self?.presenter?.presentErrorMessage(response: .init(error: error))
            }
        })
    }
}
