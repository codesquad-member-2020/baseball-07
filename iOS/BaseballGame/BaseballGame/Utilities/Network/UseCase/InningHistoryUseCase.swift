//
//  InningHistoryUseCase.swift
//  BaseballGame
//
//  Created by delma on 2020/05/14.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

struct InningHistoryUseCase {
    private let task = NetworkTask(dispatcher: NetworkDispatcher())
    
    class InningHistoryRequest: Request {
        var path: String = EndPoints.fakePlayInfo
    }
    
    func requestInningHistoryStub(handler: @escaping (Any) -> Void) {
        task.perform(request: InningHistoryRequest(), dataType: PitchHistory.self) { result in
            switch result {
            case .success(let decodedData):
                handler(decodedData)
            case .failure(let error):
                NotificationCenter.default.post(name: .networkError, object: nil, userInfo: ["error":error])
            }
        }
    }
}
