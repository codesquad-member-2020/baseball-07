//
//  PitchUseCase.swift
//  BaseballGame
//
//  Created by delma on 2020/05/13.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

struct PitchUseCase {
    private let task = NetworkTask(dispatcher: NetworkDispatcher())
    
    class PitchRequest: Request {
        var method: HTTPMethod = .post
        var path: String = EndPoints.defaultURL
        var gameId: Int
        var teamName: String
        
        init(gameId: Int, teamName: String) {
            self.gameId = gameId
            self.teamName = teamName
            self.path += EndPoints.games + "/\(self.gameId)" + "/teams/\(self.teamName)"
        }
    }
    
    func requestPitch(gameId: Int, teamName: String, handler: @escaping (Any) -> Void) {
        task.perform(request: PitchRequest(gameId: gameId, teamName: teamName), dataType: Pitch.self) { result in
            switch result {
            case .success(let decodedData):
                handler(decodedData)
            case .failure(let error):
                NotificationCenter.default.post(name: .networkError, object: nil, userInfo: ["error":error])
            }
        }
    }
}
