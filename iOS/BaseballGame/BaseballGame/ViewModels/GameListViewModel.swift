//
//  GameListViewModel.swift
//  BaseballGame
//
//  Created by delma on 2020/05/06.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

class GameListViewModel: ViewModelBinding {
    typealias Key = GameList
    private let gameList: Key
    private var changedHandler: (Key) -> ()
    
    init(gameList: GameList, handler: @escaping (Key) -> ()) {
        self.gameList = gameList
        self.changedHandler = handler
    }
    
    func performBind(changed handler: @escaping (GameList) -> ()) {
        self.changedHandler = handler
        changedHandler(gameList)
    }
    
}
