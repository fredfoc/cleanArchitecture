//
//  Injector.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 15/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit
struct InjectorImpl: Injector {}

extension InjectorImpl: ExternalModuleProtocol {
    private func getView() -> View? {
        return UIStoryboard.init(name: "Storyboard", bundle: nil).instantiateInitialViewController() as? View
    }
    func changeScreen(navigationController: UINavigationController?) {
        if let view = getView() {
            resolve(view: view)
            navigationController?.pushViewController(view, animated: true)
        }
    }
}

protocol Injector {
    func resolve() -> RouterProtocol
    func resolve(view: ViewProtocol, router: RouterProtocol) -> PresenterProtocol
    func resolve(presenter: PresenterInteractorProtocol) -> InteractorProtocol
    func resolve(view: ViewProtocol)
}

protocol PresenterProtocol: PresenterViewProtocol, PresenterInteractorProtocol {}

extension Presenter: PresenterProtocol {}

extension Injector {
    func resolve() -> RouterProtocol {
        return Router()
    }
    func resolve(view: ViewProtocol, router: RouterProtocol) -> PresenterProtocol {
        return Presenter(view: view, router: router)
    }
    func resolve(presenter: PresenterInteractorProtocol) -> InteractorProtocol {
        return Interactor(presenter: presenter)
    }
    func resolve(view: ViewProtocol) {
        var presenter = resolve(view: view, router: resolve())
        let interactor = resolve(presenter: presenter)
        presenter.setInteractor(interactor: interactor)
        view.presenter = presenter
    }
}

