//
//  AgentsListRouter.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 28/12/22.
//

import Foundation
import UIKit

protocol AgentsListDataPassing {
    var dataStore: AgentsListDataStore? { get }
}

protocol AgentsListRoutingLogic {
    func routeToDetailScreen()
}

final class AgentsListRouter: AgentsListDataPassing {

    private weak var viewController: UIViewController?
    var dataStore: AgentsListDataStore?
    
    init(viewController: UIViewController, dataStore: AgentsListDataStore? = nil) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
    
    func setup(dataStore: AgentsListDataStore? = nil) {
        self.dataStore = dataStore
    }
}

// MARK: - AgentsListRoutingLogic

extension AgentsListRouter: AgentsListRoutingLogic {
    
    func routeToDetailScreen() {
        let vc = AgentDetailsFactory.setup()
        
        guard var destinationDS = (vc as? AgentDetailsViewController)?.router?.dataStore else { return }
        
        passDataToDetailScreen(source: dataStore, destination: &destinationDS)
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func passDataToDetailScreen(source: AgentsListDataStore?, destination: inout AgentDetailsDataStore) {
        destination.agent = source?.agent
    }
}
