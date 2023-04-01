//
//  AgentsListViewController.swift
//  ValorantGuide
//
//  Created by Hellen Caroline  on 13/12/22.
//

import UIKit

protocol AgentsListDisplayLogic: AnyObject {
    func displaySuccess(_ viewModel: AgentsListModel.AgentListViewModel)
    func displaySearchSuccess(_ viewModel: AgentsListModel.AgentListViewModel)
    func displayError()
}

class AgentsListViewController: UIViewController {
    
    private var router: (AgentsListRoutingLogic & AgentsListDataPassing)?
    private var interactor: AgentsListBusinessLogic?
    var screenView: AgentListView?
    
    override func loadView() {
        super.loadView()
        self.screenView = AgentListView()
        screenView?.delegate = self
        self.view = screenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.screenView?.reloadData()
        }
        
        setupSearchBar()
        setupNavigation()
        fetchAgentList()
        loadFavorites()
    }
    
    func setup(interactor: AgentsListBusinessLogic? = nil,
               router: (AgentsListRoutingLogic & AgentsListDataPassing)? = nil) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Private Methods
    
    private func setupSearchBar() {
        let searchController = UISearchController()
        searchController.searchBar.searchTextField.textColor = .white
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = .white
        searchController.searchBar.barStyle = .black
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "buscar", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.6)])
        searchController.searchBar.searchTextField.leftView?.tintColor = .white
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    private func setupNavigation() {
        navigationItem.title = "Agentes"
        navigationItem.backButtonTitle = ""
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(addTapped))
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func fetchAgentList() {
        startLoading()
        interactor?.fetchAgentsList()
    }
    
    private func loadFavorites() {
        interactor?.loadFavorites()
        screenView?.reloadData()
    }
    
//    @objc func addTapped() {
//        navigationController?.pushViewController(FavoritesFactory.setup(), animated: true)
//    }
}

// MARK: - AgentsListDisplayLogic

extension AgentsListViewController: AgentsListDisplayLogic {

    func displaySuccess(_ viewModel: AgentsListModel.AgentListViewModel) {
        screenView?.setupUI(viewModel.agents)
        stopLoading()
    }
    
    func displaySearchSuccess(_ viewModel: AgentsListModel.AgentListViewModel) {
        screenView?.setupUI(viewModel.agents)
    }
    
    func displayError() {
        showMessage(title: "Desculpe, houve um erro", message: "Por favor, tente novamente mais tarde")
    }
}

// MARK: - HomeViewDelegate

extension AgentsListViewController: AgentListViewDelegate {

    func didSelectedAgent(at index: Int) {
        interactor?.select(at: index)
        router?.routeToDetailScreen()
    }
    
    func isFavorite(id: String) -> Bool {
        guard let isFavorite = interactor?.isFavorite(id: id) else { return false }
        return isFavorite
    }
    
    func didTapFavorite(id: String, isFavorite: Bool) {
        interactor?.salveFavoriteAgent(id: id)
    }
}

// MARK: - UISearchResultsUpdating

extension AgentsListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        interactor?.searchAgent(with: searchController.searchBar.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        loadFavorites()
    }
}
