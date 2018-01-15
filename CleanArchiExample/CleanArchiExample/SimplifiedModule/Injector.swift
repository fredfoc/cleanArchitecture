//
//  Injector.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 15/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit
struct Injector {
    private func bind(view: View) {
        let router = Router()
        var presenter = Presenter(view: view, router: router)
        let interactor = Interactor(presenter: presenter)
        presenter.setInteractor(interactor: interactor)
        view.presenter = presenter
    }
}

extension Injector: ExternalModuleProtocol {
    func changeScreen(navigationController: UINavigationController?) {
        if let view = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "View") as? View {
            bind(view: view)
            navigationController?.pushViewController(view, animated: true)
        }
        
    }
}
