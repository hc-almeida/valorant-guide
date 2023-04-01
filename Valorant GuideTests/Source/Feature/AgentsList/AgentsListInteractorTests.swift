//
//  AgentsListInteractorTests.swift
//  Valorant GuideTests
//
//  Created by Hellen Caroline  on 15/01/23.
//

import XCTest
@testable import Valorant_Guide

final class AgentsListInteractorTests: XCTestCase {
    
    private let workerSpy = AgentsListWorkerLogicSpy()
    private let presentSpy = AgentsListPresentationLogicSpy()
    
    private lazy var sut = AgentsListInteractor(presenter: presentSpy, worker: workerSpy)
    
    
    func test_fetchAgentsList_whenWorkerReturnsSuccess_shouldCallPresenterWithSuccess() {
        
        //Como usar o fixture para mockar os dados AgentsListModel.Response(data: [Agent])
        
        // Given or Arrange
        workerSpy.fetchAgentsListCompletionToBeExecuted = .success(.fixture())
        
        // When or Act
        sut.fetchAgentsList()
        
        // Then or Assert
        XCTAssertTrue(workerSpy.fetchAgentsListCalled)
        XCTAssertTrue(presentSpy.didPresentCalled)
    }
    
    func test_fetchAgentsList_whenWorkerReturnsFailure_shouldCallPresenterWithFailure() {
        
        // Given or Arrange
        let expectedError = ErrorDummy()
        workerSpy.fetchAgentsListCompletionToBeExecuted = .failure(expectedError)
        
        // When or Act
        sut.fetchAgentsList()
        
        // Then or Assert
        XCTAssertTrue(workerSpy.fetchAgentsListCalled)
        XCTAssertTrue(presentSpy.didpresentErrorCalled)
    }
    
    func test_searchAgent_whenSearchTextReturnEmpty_shouldPassArrayOfCurrentAgentList() {
        
        // Given
        var searchText = ""
        
        // When or Act
        sut.searchAgent(with: searchText)
        
        // Then or Assert
        XCTAssertTrue(presentSpy.didPresentSearchCalled)
    }
    
    func test_searchAgent_whenSearchTextReturnSuccess_shouldPassArrayOfCurrentAgentList() {
        
        // Given
        var searchText = "neon"
        
        workerSpy.fetchAgentsListCompletionToBeExecuted = .success(.fixture(data: [Agent.fixture(displayName: "neon")]))
        
        // When or Act
        sut.searchAgent(with: searchText)
        
        // Then or Assert
        XCTAssertTrue(presentSpy.didPresentSearchCalled)
    }
    
    func test_selectAtIndex() {
        
        sut.select(at: 0)
    }
}
