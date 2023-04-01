//
//  FavoritesViewController.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 20/01/23.
//

import Foundation
import UIKit

protocol FavoritesDisplayLogic: AnyObject {
    func displayFavoriteAgents(viewModel: Favorites.FetchFavorites.ViewModel)
    func displayErrorMessage(viewModel: Favorites.ErrorMessage.ViewModel)
}

final class FavoritesViewController: UIViewController {
    
    private var interactor: FavoritesBusinessLogic?
    private var router: FavoritesRoutingLogic?
    var screenView: FavoritesView?

    override func loadView() {
        super.loadView()
        self.screenView = FavoritesView()
        screenView?.delegate = self
        self.view = screenView
    }

    func setup(interactor: FavoritesBusinessLogic? = nil, router: FavoritesRoutingLogic? = nil) {
        self.interactor = interactor
        self.router = router
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchFavoriteAgentsList()
    }
}

// MARK: - FavoritesDisplayLogic

extension FavoritesViewController: FavoritesDisplayLogic {
    
    func displayFavoriteAgents(viewModel: Favorites.FetchFavorites.ViewModel) {
        screenView?.setupUI(viewModel.agents)
    }
    
    func displayErrorMessage(viewModel: Favorites.ErrorMessage.ViewModel) {
        showMessage(title: "Desculpe, houve um erro", message: viewModel.message)
    }
}

// MARK: - FavoritesViewDelegate

extension FavoritesViewController: FavoritesViewDelegate {
    
    func didTapRemove(id: String) {
        interactor?.deleteFavoriteAgent(id: id)
        interactor?.fetchFavoriteAgentsList()
        screenView?.reloadData()
    }
}
