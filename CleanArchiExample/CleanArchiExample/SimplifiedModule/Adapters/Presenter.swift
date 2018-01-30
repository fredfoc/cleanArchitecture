//
//  Presenter.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 15/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation

protocol PresenterViewProtocol {
    func triggerRequest()
}

protocol PresenterInteractorProtocol {
    func displayRequest(model: ModelProtocol)
    mutating func setInteractor(interactor: InteractorProtocol)
}

struct Presenter {
    private var view: ViewProtocol
    private var interactor: InteractorProtocol?
    private var router: RouterProtocol
    init(view: ViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    mutating func setInteractor(interactor: InteractorProtocol) {
        self.interactor = interactor
    }
}

extension Presenter: PresenterInteractorProtocol {
    func displayRequest(model: ModelProtocol) {
        view.displayResult(viewModel: ViewModel(userName: model.name))
    }
}

extension Presenter: PresenterViewProtocol {
    func triggerRequest() {
        interactor?.makeRequest()
    }
}
