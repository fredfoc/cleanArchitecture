//
//  Presenter.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 2/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation

struct ExamplePresenter {
    private var coordinator: ExampleCoordinatorProtocol?
    init(coordinator: ExampleCoordinatorProtocol?) {
        self.coordinator = coordinator
    }
}

extension ExamplePresenter: ExamplePresenterProtocol {
    func displayRequest(users: ExampleModelProtocol) {
        coordinator?.displayRequestResult(viewModel: reduceUsers(users: users))
    }
    
    private func reduceUsers(users: ExampleModelProtocol) -> ExampleViewModel {
        return ExampleViewModel(requestResult: users.names?.reduce("Names are :", { return $0 + "\n" + $1 }) ?? "no result")
    }
}
