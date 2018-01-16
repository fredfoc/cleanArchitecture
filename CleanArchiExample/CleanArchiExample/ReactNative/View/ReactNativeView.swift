//
//  ReactNativeReactNativeView.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 15/01/2018.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit

/**
 *  the way the view is presented to the presenter
 */
protocol ReactNativeViewProtocol {
    
}

class ReactNativeView: UIViewController {
	//MARK: Vipr
    var presenter: ReactNativePresenter?
}

extension ReactNativeView: ReactNativeViewProtocol {
    
}