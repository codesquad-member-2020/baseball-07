//
//  GameListCollectionViewCell.swift
//  BaseballGame
//
//  Created by delma on 2020/05/06.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class GameListTableViewCell: UITableViewCell {
    
    private let gameCard = GameListCardView()
    private let gameTitle: UILabel = {
        let label = UILabel()
        label.text = "GAME "
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "GameListTableViewCell")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureConstraints() {
        let constraints = [
            gameTitle.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            gameTitle.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 4),
            
            gameCard.topAnchor.constraint(equalTo: gameTitle.bottomAnchor, constant: 4),
            gameCard.leadingAnchor.constraint(equalTo: gameTitle.leadingAnchor),
            gameCard.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4),
        ]
        constraints.forEach { $0.isActive = true }
    }
    
    func set(gameRoomNumber number: Int) {
        gameTitle.text! += String(number)
    }
}
