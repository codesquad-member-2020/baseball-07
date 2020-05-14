//
//  GameListTitle.swift
//  BaseballGame
//
//  Created by delma on 2020/05/06.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class GameListTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.textColor = #colorLiteral(red: 0.1489628325, green: 0.3782476166, blue: 0.8519194162, alpha: 1)
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 40)
        self.text = "GAME LIST"
    }
}
