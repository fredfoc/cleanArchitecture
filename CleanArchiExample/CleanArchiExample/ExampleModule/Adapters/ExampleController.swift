//
//  ExampleController.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 2/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation

struct ExampleController {
    private var interactor: ExampleInteractorProtocol?
    private var coordinator: ExampleCoordinatorProtocol?
    init(interactor: ExampleInteractorProtocol, coordinator: ExampleCoordinatorProtocol?) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    func triggerRequest() {
        interactor?.makeRequest()
    }
    
    func moveToAnotherScreen() {
        coordinator?.moveToNextScreen()
    }
}
