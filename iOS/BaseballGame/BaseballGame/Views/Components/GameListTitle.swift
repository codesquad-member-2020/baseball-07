//
//  GameListTitle.swift
//  BaseballGame
//
//  Created by delma on 2020/05/06.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class GameListTitle: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.textColor = #colorLiteral(red: 0.03420990258, green: 0.3064265625, blue: 0.8684168782, alpha: 1)
        self.font = UIFont.boldSystemFont(ofSize: 40)
        self.text = "GAME LIST"
    }
}
