//
//  PlayInfo.swift
//  BaseballGame
//
//  Created by delma on 2020/05/13.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

struct PlayInfo: Codable {
    var pitchHistory: [PitchHistory]
    var inningTotal: InningTotal
    var game: GameInfo
}

struct PitchHistory: Codable {
    var hitter: String
    var hitterOrder: Int
    var pitchResults: [String]
}

struct InningTotal: Codable {
    var ball: Int
    var strike: Int
    var out: Int
    var base: Int
}
