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
        var path: String = EndPoints.defaultURL
        var gameId: Int
        var teamName: String
        var inning: Int
        
        init(gameId: Int, teamName: String, inning: Int) {
            self.gameId = gameId
            self.teamName = teamName
            self.inning = inning
            self.path += EndPoints.games + "/\(self.gameId)/" + EndPoints.teams + "/\(self.teamName)/" + EndPoints.inning + "/\(self.inning)"
        }
    }
    
    func requestInningHistory(gameId: Int, teamName: String, inning: Int, handler: @escaping (Any) -> Void) {
        task.perform(request: InningHistoryRequest(gameId: gameId, teamName: teamName, inning: inning), dataType: PitchHistory.self) { result in
            switch result {
            case .success(let decodedData):
                handler(decodedData)
            case .failure(let error):
                NotificationCenter.default.post(name: .networkError, object: nil, userInfo: ["error":error])
            }
        }
    }
}
