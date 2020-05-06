//
//  GameListCollectionDataSource.swift
//  BaseballGame
//
//  Created by delma on 2020/05/06.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class GameListTableDataSource: NSObject, UITableViewDataSource, ViewModelBinding {
    typealias Key = GameList
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameListTableViewCell", for: indexPath) as! GameListTableViewCell

        return cell
    }
    
    
    
}
