//
//  AgentDetailsRouter.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 31/12/22.
//

import Foundation
import UIKit

protocol AgentDetailsRoutingLogic { }

protocol AgentDetailsDataPassing {
    var dataStore: AgentDetailsDataStore? { get }
}

final class AgentDetailsRouter: AgentDetailsDataPassing {
    
    private weak var viewController: UIViewController?
    var dataStore: AgentDetailsDataStore?
    
    init(viewController: UIViewController, dataStore: AgentDetailsDataStore? = nil) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
    
    func setup(dataStore: AgentDetailsDataStore? = nil) {
        self.dataStore = dataStore
    }
}

extension AgentDetailsRouter: AgentDetailsRoutingLogic { }
