//
//  PitchHistory.swift
//  BaseballGame
//
//  Created by delma on 2020/05/13.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

struct PitchHistory: Codable {
    var pitchHistory: [InningHistory]
}

struct InningHistory: Codable {
    var inning: Int
    var histories: [InningHistoryInfo]
}

struct InningHistoryInfo: Codable {
    var hitter: String
    var hitterOrder: Int
    var pitchResults: [String]
}

