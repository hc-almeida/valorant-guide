//
//  AgentsListWorkerLogicSpy.swift
//  Valorant GuideTests
//
//  Created by Hellen Caroline  on 15/01/23.
//

import XCTest
@testable import Valorant_Guide

final class AgentsListWorkerLogicSpy: AgentsListWorkerLogic {
    
    private(set) var fetchAgentsListCalled: Bool = false
    private(set) var fetchAgentsListCallCount: Int = 0
    var fetchAgentsListCompletionToBeExecuted: Result<AgentsListModel.Response, Error>?
    
    func fetchAgentsList(completion: @escaping (Result<AgentsListModel.Response, Error>) -> Void) {
        fetchAgentsListCalled = true
        fetchAgentsListCallCount = +1
        
        if let fetchAgentsListCompletionToBeExecuted = fetchAgentsListCompletionToBeExecuted {
            completion(fetchAgentsListCompletionToBeExecuted)
        }
    }
}
