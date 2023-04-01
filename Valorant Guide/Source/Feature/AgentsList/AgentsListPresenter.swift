//
//  AgentsListPresenter.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 28/12/22.
//

import Foundation

protocol AgentsListPresentationLogic {
    func present(_ agentList: [Agent])
    func presentSearch(_ agent: [Agent])
    func presentFavoritesStatus()
    func presentError()
}

final class AgentsListPresenter {
    
    private weak var viewController: AgentsListDisplayLogic?
    
    init(viewController: AgentsListDisplayLogic) {
        self.viewController = viewController
    }
}

// MARK: - AgentsListPresentationLogic

extension AgentsListPresenter: AgentsListPresentationLogic {
    
    func presentFavoritesStatus() {
        
    }

    func present(_ agentList: [Agent]) {
        let viewModel = buildViewModel(results: agentList)
        viewController?.displaySuccess(viewModel)
    }
    
    func presentSearch(_ agent: [Agent]) {
        let viewModel = buildViewModel(results: agent)
        viewController?.displaySearchSuccess(viewModel)
    }
    
    func presentError() {
        viewController?.displayError()
    }
    
    private func buildViewModel(results: [Agent]) -> AgentsListModel.AgentListViewModel {
        let model = results.map { agent in
            AgentsListModel.AgentViewModel.init(
                id: agent.uuid,
                nameAgent: agent.displayName,
                image: agent.fullPortraitV2 ?? "",
                roleName: agent.role?.displayName.rawValue ?? "",
                backgroundImage: agent.background ?? "",
                backgroundGradient: agent.backgroundGradientColors)
        }
        
        return AgentsListModel.AgentListViewModel(agents: model)
    }
}
