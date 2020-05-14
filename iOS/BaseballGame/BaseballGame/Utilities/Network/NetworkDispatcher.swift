//
//  NetworkDispatcher.swift
//  BaseballGame
//
//  Created by delma on 2020/05/07.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

class NetworkDispatcher {
    func execute(request: Request, completion: @escaping(Result<Any, NetworkError>) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: URL(string: request.path)!) { (data, response, error) in
            guard let data = data, error == nil else {
                if let error = error as NSError?, error.domain == NSURLErrorDomain {
                    completion(.failure(.InvalidURL))
                }
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
