//
//  GameHeaderViewModel.swift
//  BaseballGame
//
//  Created by delma on 2020/05/14.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

class GameHeaderViewModel: ViewModelBinding {
    typealias Key = GameHeader?
    typealias handler = (GameHeader?) -> Void
    private var changedHandler: handler
    private var gameHeader: Key {
        didSet {
            changedHandler(gameHeader)
        }
    }
    
    init(gameHeader: GameHeader? = nil, handler: @escaping handler) {
        self.gameHeader = gameHeader
        self.changedHandler = handler
        changedHandler(gameHeader)
    }
    
    func updateNotify(changed handler: @escaping handler) {
        self.changedHandler = handler
    }
    
}
