//
//  AgentsListInteractor.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 28/12/22.
//

import Foundation
import UIKit

protocol AgentsListDataStore {
    var agent: Agent? { get set }
}

protocol AgentsListBusinessLogic {
    func fetchAgentsList()
    func select(at index: Int)
    func searchAgent(with searchText: String?)
    func salveFavoriteAgent(id: String)
    func isFavorite(id: String) -> Bool
    func loadFavorites()
}

final class AgentsListInteractor: AgentsListDataStore {

    private var presenter: AgentsListPresentationLogic?
    private var worker: AgentsListWorkerLogic?
    
    var agent: Agent?
    var agentList: [Agent] = []
    var filteredAgents: [Agent] = []
    var favoriteAgents = [FavoriteAgent]()
    var isSearching: Bool = false
    
    init(presenter: AgentsListPresentationLogic, worker: AgentsListWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

// MARK: - AgentsListBusinessLogic

extension AgentsListInteractor: AgentsListBusinessLogic {
    
    func loadFavorites() {
        worker?.loadFavoriteAgents(completion: { [weak self] result in
            switch result {
            case .success(let agents):
                self?.favoriteAgents = agents
                self?.presenter?.presentFavoritesStatus()
            case .failure(_):
                self?.presenter?.presentError()
            }
        })
    }
    
    func isFavorite(id: String) -> Bool {
        favoriteAgents.compactMap { $0.id }.contains(id)
    }

    func fetchAgentsList() {
        worker?.fetchAgentsList(completion: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.presentAgent(response.data)
            case .failure(_):
                self.presenter?.presentError()
            }
        })
    }
    
    func select(at index: Int) {
        agent = isSearching ? filteredAgents[index] : agentList[index]
    }
    
    func searchAgent(with searchText: String?) {
        if searchText?.isEmpty ?? true {
            filteredAgents = agentList
            isSearching = false
        } else {
            isSearching = true
            filteredAgents = agentList.filter({ agent in
                return agent.displayName.lowercased().contains((searchText ?? "").lowercased())
            })
        }
    
        presenter?.presentSearch(filteredAgents)
    }
    
    func salveFavoriteAgent(id: String) {
        guard let agent = agentList.first(where: { $0.uuid == id }) else { return }
        
        let firstColor = agent.backgroundGradientColors.first
        let favoriteAgent = FavoriteAgent(context: FavoriteAgentRepository.shared.context)
        
        favoriteAgent.id = agent.uuid
        favoriteAgent.name = agent.displayName
        favoriteAgent.roleName = agent.role?.displayName.rawValue
        favoriteAgent.image = agent.fullPortraitV2
        favoriteAgent.color = agent.backgroundGradientColors.first
        
        worker?.createFavoriteAgent(character: favoriteAgent, completion: { [weak self] result in
            switch result {
            case .success(_):
                debugPrint("✅ Salvo com sucesso")
            case .failure(_):
                self?.presenter?.presentError()
            }
        })
    }
    
    private func presentAgent(_ agents: [Agent]) {
        let playableAgent = agents.filter({ $0.isPlayableCharacter == true })
        
        presenter?.present(playableAgent)
        agentList.append(contentsOf: playableAgent)
    }
}
