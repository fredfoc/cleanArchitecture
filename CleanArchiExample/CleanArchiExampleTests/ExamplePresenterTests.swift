//
//  ExamplePresenterTest.swift
//  CleanArchiExampleTests
//
//  Created by fauquette fred on 2/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import XCTest
@testable import CleanArchiExample

extension ExampleViewModel: Equatable {
    
}

public func ==(lhs: ExampleViewModel, rhs: ExampleViewModel) -> Bool {
    return lhs.requestResult == rhs.requestResult
}

class ExamplePresenterTests: XCTestCase {
    
    class MockExampleCoordinator: ExampleCoordinatorProtocol {
        var displayWasCalled = false
        var model: ExampleViewModel?
        func displayRequestResult(viewModel: ExampleViewModel) {
            displayWasCalled = true
            model = viewModel
        }
        func moveToNextScreen() {}
    }
    
    var coordinator = MockExampleCoordinator()
    var presenter: ExamplePresenter!
    override func setUp() {
        super.setUp()
        coordinator = MockExampleCoordinator()
        presenter = ExamplePresenter(coordinator: coordinator)
    }
    
    func testExamplePresenter() {
        let resultModel = ExampleResultModel(users: [UserModel(name: "John Doe", email: "john_doe@gmail.com")])
        presenter.displayRequest(users: resultModel)
        XCTAssertTrue(coordinator.displayWasCalled)
        XCTAssertNotNil(coordinator.model)
    }
    
    func testExamplePresenterResult() {
        let resultModel = ExampleResultModel(users: [UserModel(name: "John Doe", email: "john_doe@gmail.com")])
        presenter.displayRequest(users: resultModel)
        let testModel = ExampleViewModel(requestResult: "Names are :\nJohn Doe:john_doe@gmail.com")
        XCTAssertEqual(coordinator.model, testModel)
    }
    
    func testExamplePresenterEmptyResult() {
        let resultModel = ExampleResultModel(users: nil)
        presenter.displayRequest(users: resultModel)
        let testModel = ExampleViewModel(requestResult: "no result")
        XCTAssertEqual(coordinator.model, testModel)
    }
    
}
