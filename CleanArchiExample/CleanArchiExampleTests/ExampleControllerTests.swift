//
//  ExampleControllerTest.swift
//  CleanArchiExampleTests
//
//  Created by fauquette fred on 2/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import XCTest
@testable import CleanArchiExample



class ExampleControllerTests: XCTestCase {
    
    class MockExampleCoordinator: ExampleCoordinatorProtocol {
        var moveWasCalled = false
        func displayRequestResult(viewModel: ExampleViewModel) {}
        func moveToNextScreen() {
            moveWasCalled = true
        }
    }
    
    class MockExampleInteractor: ExampleInteractorProtocol {
        var makeRequestWasCalled = false
        func makeRequest() {
            makeRequestWasCalled = true
        }
    }
    
    var coordinator: MockExampleCoordinator!
    var interactor: MockExampleInteractor!
    var controller: ExampleController!
    override func setUp() {
        super.setUp()
        interactor = MockExampleInteractor()
        coordinator = MockExampleCoordinator()
        controller = ExampleController(interactor: interactor, coordinator: coordinator)
    }
    
    func testExampleControllerTriggerRequestCall() {
        controller.triggerRequest()
        XCTAssertTrue(interactor.makeRequestWasCalled)
    }
    
    func testExampleControllerNextSCreenCall() {
        controller.moveToAnotherScreen()
        XCTAssertTrue(coordinator.moveWasCalled)
    }
    
}
