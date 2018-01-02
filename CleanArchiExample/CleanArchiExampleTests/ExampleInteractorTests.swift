//
//  ExampleInteractorTests.swift
//  CleanArchiExampleTests
//
//  Created by fauquette fred on 2/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import XCTest
@testable import CleanArchiExample



class ExampleInteractorTests: XCTestCase {
    
    class MockExamplePresenter: ExamplePresenterProtocol {
        var wasCalled = false
        var model: ExampleModelProtocol?
        func displayRequest(users: ExampleModelProtocol) {
            wasCalled = true
            model = users
        }
    }
    
    enum MockedError: Error {
        case error
    }
    
    enum MockExampleRequestManagerResult {
        case empty
        case full
        case failure
        
        var result: ExampleInteractorResult {
            switch self {
            case .empty:
                return ExampleInteractorResult.success(nil)
            case .full:
                return ExampleInteractorResult.success([UserModel(name: "John Doe", email: "john_doe@gmail.com")])
            default:
                return ExampleInteractorResult.failure(MockedError.error)
            }
        }
    }
    
    class MockExampleRequestManager: ExampleRequestManagerProtocol {
        var wasCalled = false
        var resultType: MockExampleRequestManagerResult = .empty
        func getResult(completion: @escaping (ExampleInteractorResult) -> Void) {
            wasCalled = true
            completion(resultType.result)
        }
    }
    
    var presenter = MockExamplePresenter()
    var requestManager: MockExampleRequestManager!
    var interactor: ExampleInteractor!
    override func setUp() {
        super.setUp()
        presenter = MockExamplePresenter()
        requestManager = MockExampleRequestManager()
        interactor = ExampleInteractor(presenter: presenter,
                                       requestManager: requestManager)
    }
    func testExampleInteractor() {
        interactor.makeRequest()
        XCTAssertTrue(requestManager.wasCalled)
        XCTAssertTrue(presenter.wasCalled)
    }
    
    func testExampleCoordinatorTransmitEmptyModel() {
        requestManager.resultType = .empty
        interactor.makeRequest()
        XCTAssertNil(presenter.model?.names)
    }
    
    func testExampleCoordinatorTransmitFailure() {
        requestManager.resultType = .failure
        interactor.makeRequest()
        XCTAssertNil(presenter.model?.names)
    }
    
    func testExampleCoordinatorTransmitModel() {
        requestManager.resultType = .full
        interactor.makeRequest()
        XCTAssertEqual(presenter.model!.names!, ["John Doe:john_doe@gmail.com"])
    }
    
}
