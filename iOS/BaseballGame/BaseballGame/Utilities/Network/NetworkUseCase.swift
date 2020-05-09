//
//  NetworkUseCase.swift
//  BaseballGame
//
//  Created by delma on 2020/05/09.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

struct NetworkUseCase {
    static func requestFakeGameList(handler: @escaping (Any) -> Void ) {
        let task = NetworkTask(dispatcher: NetworkDispatcher())
        task.perform(request: MockGameListRequest(), dataType: GameList.self) { result in
            switch result {
            case .success(let decodedData):
                handler(decodedData)
            case .failure(let error):
                NotificationCenter.default.post(name: .networkError, object: nil, userInfo: ["error":error])
            }
        }
    }
}
