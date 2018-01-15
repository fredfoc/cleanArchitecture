//
//  Router.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 15/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation

protocol RouterProtocol {
    func changeRoute()
}

struct Router {
    
}

extension Router: RouterProtocol {
    func changeRoute() {
        print("change route")
    }
}
