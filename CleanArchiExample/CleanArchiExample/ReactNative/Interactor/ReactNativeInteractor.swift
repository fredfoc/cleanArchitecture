//
//  ReactNativeReactNativeInteractor.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 15/01/2018.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation

/**
 *  the way the interactor is presented to the presenter
 */
protocol ReactNativeInteractorProtocol {
    
}

struct ReactNativeInteractor {
    var presenter: ReactNativePresenterProtocol
}

extension ReactNativeInteractor: ReactNativeInteractorProtocol {
    
}