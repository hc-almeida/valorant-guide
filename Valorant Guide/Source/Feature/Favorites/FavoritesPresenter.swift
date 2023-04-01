//
//  FavoritesPresenter.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 20/01/23.
//

import Foundation

protocol FavoritesPresentationLogic {
    func presentFavoriteAgents(response: Favorites.FetchFavorites.Response)
    func presentErrorMessage(response: Favorites.ErrorMessage.Response)
}

final class FavoritesPresenter {
    
    private weak var viewController: FavoritesDisplayLogic?
    
    init(viewController: FavoritesDisplayLogic) {
        self.viewController = viewController
    }
}

// MARK: - FavoritesPresentationLogic

extension FavoritesPresenter: FavoritesPresentationLogic {
    
    func presentFavoriteAgents(response: Favorites.FetchFavorites.Response) {
        viewController?.displayFavoriteAgents(viewModel: .init(agents: response.agents))
    }
    
    func presentErrorMessage(response: Favorites.ErrorMessage.Response) {
        viewController?.displayErrorMessage(viewModel: .init(message: response.error.errorDescription ?? ""))
    }
}
