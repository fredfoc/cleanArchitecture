//
//  ExampleViewProtocol.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 2/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit

protocol ExampleViewProtocol {
    func displayRequestResult(viewModel: ExampleViewModel)
    var navigationController: UINavigationController? {get}
}
