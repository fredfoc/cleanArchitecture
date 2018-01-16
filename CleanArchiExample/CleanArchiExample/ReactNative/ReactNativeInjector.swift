//
//  ReactNativeReactNativeInjector.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 15/01/2018.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit

struct ReactNativeInjector {
    private func bind(view: ReactNativeView) {
        let router = ReactNativeRouter()
        var presenter = ReactNativePresenter(view: view, router: router)
        let interactor = ReactNativeInteractor(presenter: presenter)
        presenter.setInteractor(interactor: interactor)
        view.presenter = presenter
    }
    private func getView() -> ReactNativeView? {
        return UIStoryboard.init(name: "ReactNativeStoryboard", bundle: nil).instantiateInitialViewController() as? ReactNativeView
    }
}

extension ReactNativeInjector: ExternalModuleProtocol {    
    func changeScreen(navigationController: UINavigationController?) {
        if let view = getView() {
            bind(view: view)
            navigationController?.pushViewController(view, animated: true)
        }
    }
}
