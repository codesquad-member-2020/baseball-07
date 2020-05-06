//
//  GameListCardView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/06.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class GameListCardView: UIView {

    private let homeTeam = ParticipantLabel()
    private let visitingTeam = ParticipantLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureBackgroundColor() {
        self.backgroundColor = #colorLiteral(red: 1, green: 0.730245653, blue: 0, alpha: 1)
    }
    
    private func configureConstraints() {
        
    }
    
}
