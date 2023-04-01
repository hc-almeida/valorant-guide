//
//  AgentsListPresentationLogicSpy.swift
//  Valorant GuideTests
//
//  Created by Hellen Caroline  on 15/01/23.
//

import XCTest
@testable import Valorant_Guide

final class AgentsListPresentationLogicSpy: AgentsListPresentationLogic {
 
    private(set) var didPresentCalled: Bool = false
    private(set) var didPresentCallCount: Int = 0
    private(set) var didPresentResponsePassed: [Agent]?
    
    func present(_ agentList: [Agent]) {
        didPresentCalled = true
        didPresentCallCount = +1
        didPresentResponsePassed = agentList
    }
    
    private(set) var didPresentSearchCalled: Bool = false
    private(set) var didPresentSearchCallCount: Int = 0
    
    func presentSearch(_ agent: [Agent]) {
        didPresentSearchCalled = true
        didPresentSearchCallCount = +1
        didPresentResponsePassed = agent
    }
    
    private(set) var didpresentErrorCalled: Bool = false
    private(set) var didpresentErrorCallCount: Int = 0
    
    func presentError() {
        didpresentErrorCalled = true
        didpresentErrorCallCount += 1
    }
}
