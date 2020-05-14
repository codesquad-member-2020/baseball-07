//
//  NetworkTask.swift
//  BaseballGame
//
//  Created by delma on 2020/05/07.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

class NetworkTask {
    let dispatcher: NetworkDispatcher
    
    init(dispatcher: NetworkDispatcher) {
        self.dispatcher = dispatcher
    }
    
    func perform<T: Decodable>(request: Request, dataType: T.Type, completion: @escaping(Result<Any, NetworkError>) -> Void) {
        dispatcher.execute(request: request) { result in
            switch result {
            case .success(let data):
                guard let decodedData = try? JSONDecoder().decode(dataType, from: data as! Data) else { return }
               completion(.success(decodedData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
} 
