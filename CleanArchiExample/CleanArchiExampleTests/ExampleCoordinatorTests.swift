//
//  ExampleCoordinatorTests.swift
//  CleanArchiExampleTests
//
//  Created by fauquette fred on 2/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import XCTest
@testable import CleanArchiExample



class ExampleCoordinatorTests: XCTestCase {
    
    class MockExampleView: ExampleViewProtocol {
        var wasCalled = false
        var model: ExampleViewModel?
        func displayRequestResult(viewModel: ExampleViewModel) {
            wasCalled = true
            model = viewModel
        }
    }
    
    class MockExampleExternalModule: ExternalModuleProtocol {
        var wasCalled = false
        func changeScreen() {
            wasCalled = true
        }
    }

    var view = MockExampleView()
    var externalModule = MockExampleExternalModule()
    var coordinator: ExampleCoordinator!
    override func setUp() {
        super.setUp()
        view = MockExampleView()
        externalModule = MockExampleExternalModule()
        coordinator = ExampleCoordinator(view: view, externalModule: externalModule)
    }
    func testExampleCoordinator() {
        coordinator.displayRequestResult(viewModel: ExampleViewModel(requestResult: "no result"))
        XCTAssertTrue(view.wasCalled)
        XCTAssertNotNil(view.model)
    }
    
    func testExampleCoordinatorTransmitModel() {
        let testModel = ExampleViewModel(requestResult: "no result")
        coordinator.displayRequestResult(viewModel: testModel)
        XCTAssertEqual(view.model, testModel)
    }
    
    func testExampleCoordinatorChangeScreen() {
        coordinator.moveToNextScreen()
        XCTAssertTrue(externalModule.wasCalled)
    }
    
}
