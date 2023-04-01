//
//  AgentsDetailsModel.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 06/01/23.
//

import Foundation

enum AgentsDetailsModel {
    
    struct Request { }
    struct Response { }
    
    struct AgentDetailsViewModel {
        let id: String
        let image: String
        let backgroundImage: String
        let nameAgent: String
        let roleName: String
        let roleIcon: String
        let descriptionAgent: String
        let skills: [Skills]
    }
    
    struct Skills {
        let name: String
        let description: String
        let displayIcon: String
    }
}
