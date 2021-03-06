//
//  ExampleRequestManagerProtocol.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 2/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation

enum ExampleInteractorResult {
    case success([UserModel]?)
    case failure(Error)
}

protocol ExampleRequestManagerProtocol {
    func getResult(completion: @escaping (ExampleInteractorResult) -> Void)
}
