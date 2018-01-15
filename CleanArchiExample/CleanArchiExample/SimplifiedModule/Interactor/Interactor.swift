//
//  Interactor.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 15/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation

protocol InteractorProtocol {
    func makeRequest()
}

struct Interactor {
    var presenter: PresenterProtocol
}

extension Interactor: InteractorProtocol {
    func makeRequest() {
        presenter.displayRequest(model: Model())
    }
}
