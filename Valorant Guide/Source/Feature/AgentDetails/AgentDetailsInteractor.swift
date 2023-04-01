//
//  AgentDetailsInteractor.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 31/12/22.
//

import Foundation

protocol AgentDetailsBusinessLogic {
    func requestViewData()
}

protocol AgentDetailsDataStore {
    var agent: Agent? { get set }
}

final class AgentDetailsInteractor: AgentDetailsDataStore {
    
    private var presenter: AgentDetailsPresentationLogic?
    var agent: Agent?
    
    init(presenter: AgentDetailsPresentationLogic) {
        self.presenter = presenter
    }
}

// MARK: - AgentDetailsBusinessLogic

extension AgentDetailsInteractor: AgentDetailsBusinessLogic {
    
    func requestViewData() {
        guard let agent = agent else { return }
        presenter?.presentView(with: agent)
    }
}
