//
//  GameListViewModel.swift
//  BaseballGame
//
//  Created by delma on 2020/05/06.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class GameListViewModel: NSObject, UITableViewDataSource, ViewModelBinding {
    typealias Key = GameList?
    typealias handler = (GameList?) -> Void
    private var changedHandler: handler
    private var gameList: Key {
        didSet {
            changedHandler(gameList)
        }
    }
    
    init(gameList: GameList? = nil, handler: @escaping handler) {
        self.gameList = gameList
        self.changedHandler = handler
        changedHandler(gameList)
    }
    
    func updateNotify(changed handler: @escaping handler) {
        self.changedHandler = handler
    }

    func set(gameList: GameList) {
        self.gameList = gameList
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameList?.games.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameListTableViewCell", for: indexPath) as! GameListTableViewCell
        cell.configureCell(gameInfo: (gameList?.games[indexPath.row])!)
        return cell
        
    }
}
