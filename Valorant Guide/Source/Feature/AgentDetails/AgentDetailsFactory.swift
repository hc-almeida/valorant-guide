//
//  AgentDetailsFactory.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 31/12/22.
//

import Foundation
import UIKit

final class AgentDetailsFactory {
    static func setup() -> UIViewController {
        let viewController = AgentDetailsViewController()
        let router = AgentDetailsRouter(viewController: viewController)
        let presenter = AgentDetailsPresenter(viewController: viewController)
        let interactor = AgentDetailsInteractor(presenter: presenter)
        router.dataStore = interactor
        
        viewController.setup(interactor: interactor, router: router)
        router.setup(dataStore: interactor)
        return viewController
    }
}
