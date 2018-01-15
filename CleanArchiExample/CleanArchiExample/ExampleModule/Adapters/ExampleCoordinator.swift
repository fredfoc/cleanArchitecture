//
//  ExampleCoordinator.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 2/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit

struct ExampleCoordinator {
    private var view: ExampleViewProtocol?
    private var externalModule: ExternalModuleProtocol?
    init(view: ExampleViewProtocol?, externalModule: ExternalModuleProtocol?) {
        self.view = view
        self.externalModule = externalModule
    }
}

extension ExampleCoordinator: ExampleCoordinatorProtocol {
    func displayRequestResult(viewModel: ExampleViewModel) {
        view?.displayRequestResult(viewModel: viewModel)
    }
    
    func moveToNextScreen() {
        externalModule?.changeScreen(navigationController: view?.navigationController)
    }
}
