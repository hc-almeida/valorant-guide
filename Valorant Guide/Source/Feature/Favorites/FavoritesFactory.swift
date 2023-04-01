//
//  FavoritesFactory.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 20/01/23.
//

import Foundation
import UIKit

final class FavoritesFactory {
    static func setup() -> UIViewController {
        let viewController = FavoritesViewController()
        let router = FavoritesRouter(viewController: viewController)
        let presenter = FavoritesPresenter(viewController: viewController)
        let interactor = FavoritesInteractor(presenter: presenter, worker: FavoritesWorker())
        viewController.setup(interactor: interactor, router: router)
        return viewController
    }
}
