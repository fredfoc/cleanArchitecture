//
//  ViewController.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 2/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit

class ExampleView: UIViewController {

    @IBOutlet weak var mainActivity: UIActivityIndicatorView!
    var controller: ExampleController?
    @IBOutlet private weak var resultTextView: UITextView!
    @IBAction func trigger(_ sender: Any) {
        mainActivity.startAnimating()
        controller?.triggerRequest()
    }
    
    @IBAction func changeScreen(_ sender: Any) {
        controller?.moveToAnotherScreen()
    }
    
}

extension ExampleView: ExampleViewProtocol {
    func displayRequestResult(viewModel: ExampleViewModel) {
        resultTextView.text = viewModel.requestResult
        mainActivity.stopAnimating()
    }
}

