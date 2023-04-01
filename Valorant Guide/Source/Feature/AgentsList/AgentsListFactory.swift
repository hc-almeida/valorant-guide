//
//  AgentsListFactory.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 28/12/22.
//

import Foundation
import UIKit

final class AgentsListFactory {
    static func setup() -> UIViewController {
        let viewController = AgentsListViewController()
        let router = AgentsListRouter(viewController: viewController)
        let presenter = AgentsListPresenter(viewController: viewController)
        let interactor = AgentsListInteractor(presenter: presenter, worker: AgentsListWorker())
        viewController.setup(interactor: interactor, router: router)
        router.setup(dataStore: interactor)
        return viewController
    }
}
