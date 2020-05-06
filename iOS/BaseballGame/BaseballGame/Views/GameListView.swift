//
//  GameListView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/04.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class GameListView: UIView {

    private let gameList: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.03420990258, green: 0.3064265625, blue: 0.8684168782, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "GAME LIST"
        return label
    }()
    
    
}
