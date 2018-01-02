//
//  RequestManagerExtension.swift
//  CleanArchiExample
//
//  Created by fauquette fred on 2/01/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation
import Alamofire

extension RequestManager: ExampleRequestManagerProtocol {
    func getResult(completion: @escaping (ExampleInteractorResult) -> Void) {
        Alamofire
            .request("https://api.randomuser.me/?nat=US&results=5")
            .responseJSON { (response) in
            switch response.result {
            case .success(let value):
                if let value = value as? [String: Any], let results = value["results"] as? [Any] {
                    completion(ExampleInteractorResult.success(
                        results.map({ (data) -> UserModel in
                            if let data = data as? [String: Any], let name = data["name"] as? [String: Any] {
                                return UserModel(name: name["last"] as! String, email: data["email"] as! String)
                            }
                            return UserModel(name: "No Name", email: "No Email")
                        })
                    ))
                } else {
                    completion(ExampleInteractorResult.success(nil))
                }
            case .failure(let error):
                completion(ExampleInteractorResult.failure(error))
            }
        }
    }
}
