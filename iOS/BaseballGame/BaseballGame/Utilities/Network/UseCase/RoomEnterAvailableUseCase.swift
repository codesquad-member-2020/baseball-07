//
//  RoomEnterAvailableUseCase.swift
//  BaseballGame
//
//  Created by delma on 2020/05/16.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

struct RoomEnterAvailableUseCase {
      private let task = NetworkTask(dispatcher: NetworkDispatcher())
      
      class RoomEnterAvailableRequest: Request {
        var path: String = EndPoints.defaultURL
        var gameId: Int
        var teamName: String
        
        init(gameId: Int, teamName: String) {
            self.gameId = gameId
            self.teamName = teamName
            self.path += "/\(self.gameId)" + "/teams/\(self.teamName)"
        }
      }
      
    func requestRoomEnterAvailable(gameId: Int, teamName: String, handler: @escaping (Any) -> Void) {
          task.perform(request: RoomEnterAvailableRequest(gameId: gameId, teamName: teamName), dataType: EnterRequest.self) { result in
              switch result {
              case .success(let decodedData):
                  handler(decodedData)
              case .failure(let error):
                  NotificationCenter.default.post(name: .networkError, object: nil, userInfo: ["error":error])
              }
          }
      }
}
