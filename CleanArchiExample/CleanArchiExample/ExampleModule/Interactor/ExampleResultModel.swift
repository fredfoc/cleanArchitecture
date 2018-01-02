//
//  ExampleResultModel.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 2/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation

struct ExampleResultModel {
    var users: [UserModel]?
}

extension ExampleResultModel: ExampleModelProtocol {
    var names: [String]? {
        return users?.map {
            return $0.name + ":" + $0.email
        }
    }
}
