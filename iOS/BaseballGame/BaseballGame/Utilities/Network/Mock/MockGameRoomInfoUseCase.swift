//
//  MockGameRoomInfoUseCase.swift
//  BaseballGame
//
//  Created by delma on 2020/05/13.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

struct MockGameRoomInfoUseCase {
    
      private let task = NetworkTask(dispatcher: NetworkDispatcher())
      
      class MockGameRoomRequest: Request {
        var path: String = EndPoints.fakeGameRoomEmpty
      }
      
      func requestPitchStub(handler: @escaping (Any) -> Void) {
          task.perform(request: MockGameRoomRequest(), dataType: GameRoomEmpty.self) { result in
              switch result {
              case .success(let decodedData):
                  handler(decodedData)
              case .failure(let error):
                  NotificationCenter.default.post(name: .networkError, object: nil, userInfo: ["error":error])
              }
          }
      }
}
