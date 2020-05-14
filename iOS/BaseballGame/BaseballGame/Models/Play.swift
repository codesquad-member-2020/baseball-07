//
//  Play.swift
//  BaseballGame
//
//  Created by delma on 2020/05/14.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

struct Play {
    var pitch: Pitch
    var playInfo: PlayInfo
    
    var gameHeader: GameHeader
//    var gameField: GameField
//    var nowTurnPlayerInfo: NowTurnPlayerInfo
//    var inningHistory: [InningHistory]
    
    init(pitch: Pitch, playInfo: PlayInfo ) {
        self.pitch = pitch
        self.playInfo = playInfo
        self.gameHeader = GameHeader(pitch: pitch, playInfo: playInfo)
    }
}

struct GameHeader {
    var pitch: Pitch
    var playInfo: PlayInfo
    var homeTeamName: String
    var awayTeamName: String
    var homeTeamScore: Int
    var awayTeamScore: Int
    
    init(pitch: Pitch, playInfo: PlayInfo ) {
        self.pitch = pitch
        self.playInfo = playInfo
        self.homeTeamName = playInfo.game.homeTeam.name
        self.awayTeamName = playInfo.game.awayTeam.name
        self.homeTeamScore = playInfo.game.homeTeam.score ?? 0
        self.awayTeamScore = playInfo.game.awayTeam.score ?? 0
    }
    
}
