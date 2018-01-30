//
//  View.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 15/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit

protocol ViewProtocol: class {
    func displayResult(viewModel: ViewModel)
    var presenter: PresenterViewProtocol? {get set}
}

class View: UIViewController {
    var presenter: PresenterViewProtocol?
    @IBAction func trigger(_ sender: Any) {
        presenter?.triggerRequest()
    }
}

extension View: ViewProtocol {
    func displayResult(viewModel: ViewModel) {
        print("result\(viewModel.userName)")
    }
}
