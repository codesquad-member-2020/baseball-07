//
//  MockPitchUseCase.swift
//  BaseballGame
//
//  Created by delma on 2020/05/13.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

struct MockPitchUseCase {
    
    private let task = NetworkTask(dispatcher: NetworkDispatcher())
    
    class MockPitchRequest: Request {
        var method: HTTPMethod = .post
        var path: String = EndPoints.fakePitch
    }
    
    func requestPitchStub(handler: @escaping (Any) -> Void) {
        task.perform(request: MockPitchRequest(), dataType: Pitch.self) { result in
            switch result {
            case .success(let decodedData):
                handler(decodedData)
            case .failure(let error):
                NotificationCenter.default.post(name: .networkError, object: nil, userInfo: ["error":error])
            }
        }
    }
}
