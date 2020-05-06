//
//  GameList.swift
//  BaseballGame
//
//  Created by delma on 2020/05/06.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

struct GameList: Codable {
    var games: [GameInfo]
}

struct GameInfo: Codable {
    var id: Int
    var home_team: TeamInfo
    var away_team: TeamInfo
}

struct TeamInfo: Codable {
    var id: Int
    var name: String
}
