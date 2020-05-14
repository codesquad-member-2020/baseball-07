//
//  MockPitchHistoryUseCase.swift
//  BaseballGame
//
//  Created by delma on 2020/05/14.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

struct MockInningHistoryUseCase {
    private let task = NetworkTask(dispatcher: NetworkDispatcher())
    
    class MockPitchRequest: Request {
        var path: String = EndPoints.fakePlayInfo
    }
    
    func requestPitchStub(handler: @escaping (Any) -> Void) {
        task.perform(request: MockPitchRequest(), dataType: InningHistory.self) { result in
            switch result {
            case .success(let decodedData):
                handler(decodedData)
            case .failure(let error):
                NotificationCenter.default.post(name: .networkError, object: nil, userInfo: ["error":error])
            }
        }
    }
}
