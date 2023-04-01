//
//  FavoritesRouter.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 20/01/23.
//

import Foundation
import UIKit

protocol FavoritesRoutingLogic {
    
}

final class FavoritesRouter {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension FavoritesRouter: FavoritesRoutingLogic {
    
}
