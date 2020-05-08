//
//  GameListCollectionDataSource.swift
//  BaseballGame
//
//  Created by delma on 2020/05/06.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class GameListTableDataSource: NSObject, UITableViewDataSource {
    
    private let gameListViewModel: GameListViewModel
    
    init(gameListViewModel: GameListViewModel) {
        self.gameListViewModel = gameListViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameListTableViewCell", for: indexPath) as! GameListTableViewCell
       
        return cell
    }
    
}
