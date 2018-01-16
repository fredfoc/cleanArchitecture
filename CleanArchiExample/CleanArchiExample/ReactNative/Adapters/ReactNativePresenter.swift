//
//  ReactNativeReactNativePresenter.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 15/01/2018.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation

/**
 *  the way the presenter is presented to the interactor
 */
protocol ReactNativePresenterProtocol {
    
}

struct ReactNativePresenter {
    private var view: ReactNativeViewProtocol
    private var interactor: ReactNativeInteractorProtocol?
    private var router: ReactNativeRouterProtocol
    init(view: ReactNativeViewProtocol, router: ReactNativeRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    mutating func setInteractor(interactor: ReactNativeInteractorProtocol) {
        self.interactor = interactor
    }
    
}

extension ReactNativePresenter: ReactNativePresenterProtocol {
    
}