//
//  PlayInfo.swift
//  BaseballGame
//
//  Created by delma on 2020/05/13.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

struct InningHistory: Codable {
    var pitchHistory: [PitchHistory]
}

struct PitchHistory: Codable {
    var hitter: String
    var hitterOrder: Int
    var pitchResults: [String]
}
