//
//  ExampleModelTest.swift
//  CleanArchiExampleTests
//
//  Created by fauquette fred on 2/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import XCTest
@testable import CleanArchiExample

class ExampleModelTests: XCTestCase {
    
    func testProtocolExtensionModel() {
        let resultModel = ExampleResultModel(users: [UserModel(name: "John Doe", email: "john_doe@gmail.com")])
        XCTAssertNotNil(resultModel.names)
        XCTAssertTrue(resultModel.names!.count == 1)
        XCTAssertEqual(resultModel.names![0], "John Doe:john_doe@gmail.com")
    }
    
}
