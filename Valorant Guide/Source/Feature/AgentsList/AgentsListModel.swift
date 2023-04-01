//
//  AgentsListModel.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 27/12/22.
//

import Foundation

enum AgentsListModel {
    
    struct Request: NetworkRequest {
        var urlString: String = "https://valorant-api.com/v1/agents?language=pt-BR"
        var httpMethod: HTTPMethod = .get
    }
    
    struct Response: Codable {
        let data: [Agent]
    }
    
    struct AgentListViewModel {
        let agents: [AgentViewModel]
    }
    
    struct AgentViewModel {
        let id: String
        let nameAgent: String
        let image: String
        let roleName: String
        let backgroundImage: String
        let backgroundGradient: [String]
    }
}
