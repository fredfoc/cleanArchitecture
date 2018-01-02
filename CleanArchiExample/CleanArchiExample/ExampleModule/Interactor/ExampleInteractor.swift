//
//  ExampleInteractor.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 2/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation

struct ExampleInteractor {
    var presenter: ExamplePresenterProtocol
    var requestManager: ExampleRequestManagerProtocol
}

extension ExampleInteractor: ExampleInteractorProtocol {
    func makeRequest() {
        requestManager.getResult { (result) in
            switch result {
            case .success(let users):
                self.presenter.displayRequest(users: ExampleResultModel(users: users))
            case .failure:
                self.presenter.displayRequest(users: ExampleResultModel(users: nil))
            }
        }
        
    }
}
