//
//  GameRoomInfoUseCase.swift
//  BaseballGame
//
//  Created by delma on 2020/05/13.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

struct GameRoomInfoUseCase {
      private let task = NetworkTask(dispatcher: NetworkDispatcher())
      
      class GameRoomRequest: Request {
        var path: String = EndPoints.defaultURL + EndPoints.games
        var gameId: Int
        
        init(gameId: Int) {
            self.gameId = gameId
            self.path += "/\(self.gameId)"
        }
      }
      
    func requestGameRoomInfo(gameId: Int, handler: @escaping (Any) -> Void) {
          task.perform(request: GameRoomRequest(gameId: gameId), dataType: GameRoomEmpty.self) { result in
              switch result {
              case .success(let decodedData):
                  handler(decodedData)
              case .failure(let error):
                  NotificationCenter.default.post(name: .networkError, object: nil, userInfo: ["error":error])
              }
          }
      }
}
