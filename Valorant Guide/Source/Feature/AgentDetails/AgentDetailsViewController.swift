//
//  AgentDetailsViewController.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 17/12/22.
//

import Foundation
import UIKit

protocol AgentDetailsDisplayLogic: AnyObject {
    func displaySuccess(_ viewModel: AgentsDetailsModel.AgentDetailsViewModel)
}

class AgentDetailsViewController: UIViewController {
    
    var router: (AgentDetailsRoutingLogic & AgentDetailsDataPassing)?
    private var interactor: AgentDetailsBusinessLogic?
    var screenView: AgentsDetailsView?
    
    override func loadView() {
        super.loadView()
        self.screenView = AgentsDetailsView()
        self.view = screenView
    }
    
    func setup(interactor: AgentDetailsBusinessLogic? = nil, router: (AgentDetailsRoutingLogic & AgentDetailsDataPassing)? = nil) {
        self.interactor = interactor
        self.router = router
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.requestViewData()
    }
}

// MARK: - AgentDetailsDisplayLogic

extension AgentDetailsViewController: AgentDetailsDisplayLogic {
    
    func displaySuccess(_ viewModel: AgentsDetailsModel.AgentDetailsViewModel) {
        screenView?.setupUI(viewModel: viewModel)
    }
}
