//
//  AgentDetailsPresenter.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 31/12/22.
//

import Foundation

protocol AgentDetailsPresentationLogic {
    func presentView(with data: Agent)
}

final class AgentDetailsPresenter {
    
    private weak var viewController: AgentDetailsDisplayLogic?
    
    init(viewController: AgentDetailsDisplayLogic) {
        self.viewController = viewController
    }
}

extension AgentDetailsPresenter: AgentDetailsPresentationLogic {
    
    func presentView(with data: Agent) {
        let viewModel = buildViewModel(result: data)
        viewController?.displaySuccess(viewModel)
    }
    
    private func buildViewModel(result: Agent) -> AgentsDetailsModel.AgentDetailsViewModel {
            
        let skills = result.abilities.map { ability in
            AgentsDetailsModel.Skills.init(
                name: ability.abilityName,
                description: ability.abilityDescription,
                displayIcon: ability.abilityIcon ?? "")
        }
        
        let viewModel = AgentsDetailsModel.AgentDetailsViewModel.init(
            id: result.uuid,
            image: result.fullPortraitV2 ?? "",
            backgroundImage: result.background ?? "",
            nameAgent: result.displayName,
            roleName: result.role?.displayName.rawValue ?? "",
            roleIcon: result.role?.displayIcon ?? "s",
            descriptionAgent: result.description,
            skills: skills)
        return viewModel
        
    }
}
