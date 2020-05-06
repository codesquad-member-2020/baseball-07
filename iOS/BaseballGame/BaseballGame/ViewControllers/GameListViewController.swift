//
//  GameListViewController.swift
//  BaseballGame
//
//  Created by delma on 2020/05/04.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

final class GameListViewController: UIViewController {
    
    private let gameListTitle = GameListTitle()
    private let gameListCollectionView = GameListCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraints()
    }
    
    private func configureConstraints() {
        let constraints = [
            gameListTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gameListTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
            
            gameListCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gameListCollectionView.topAnchor.constraint(equalTo: gameListTitle.bottomAnchor, constant: 20),
            gameListCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
        ]
        constraints.forEach { $0.isActive = true }
    }
    
}
