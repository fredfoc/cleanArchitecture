//
//  Model.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 15/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation

protocol ModelProtocol {
    var name: String {get}
}

struct Model {
    
}

extension Model: ModelProtocol {
    var name: String {
        return "Fred"
    }
}
