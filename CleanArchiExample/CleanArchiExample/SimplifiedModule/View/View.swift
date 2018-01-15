//
//  View.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 15/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit

protocol ViewProtocol {
    func displayResult(viewModel: ViewModel)
}

class View: UIViewController {
    var presenter: Presenter?
    @IBAction func trigger(_ sender: Any) {
        presenter?.triggerRequest()
    }
}

extension View: ViewProtocol {
    func displayResult(viewModel: ViewModel) {
        print("result\(viewModel.userName)")
    }
}
