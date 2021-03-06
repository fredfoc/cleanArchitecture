//
//  Injector.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 2/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit

struct ExampleInjector {
    func bind(view: UIViewController?) {
        if let view = view as? ExampleView {
            let coordinator = ExampleCoordinator(view: view, externalModule: nil)
            let presenter  = ExamplePresenter(coordinator: coordinator)
            let interactor = ExampleInteractor(presenter: presenter, requestManager: RequestManager())
            let controller = ExampleController(interactor: interactor, coordinator: coordinator)
            view.controller = controller
        }
    }
}
