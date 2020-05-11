//
//  PlayViewController.swift
//  BaseballGame
//
//  Created by delma on 2020/05/09.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    private let gameHeaderView = GameHeaderView()
    private let gameFieldView = GameFieldView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
 
    private func configure() {
        self.view.addSubview(gameHeaderView)
        self.view.addSubview(gameFieldView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        let constraints = [
        gameHeaderView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
        gameHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
        gameHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),
        gameHeaderView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 8),
        
        gameFieldView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        gameFieldView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        gameFieldView.topAnchor.constraint(equalTo: gameHeaderView.bottomAnchor, constant: 5),
        gameFieldView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 3),
        ]
        constraints.forEach { $0.isActive = true }
    }
}
