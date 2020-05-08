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
    @IBOutlet var gameListTableView: GameListTableView!
    private var gameListDataSource: GameListTableDataSource!
    
    private let gameListRequest = MockGameListRequest()
    private let dispatcher = NetworkDispatcher()
    private lazy var task = NetworkTask(dispatcher: dispatcher)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        requestData()
    }
    
    private func configure() {
        gameListTableView.register(GameListTableViewCell.self, forCellReuseIdentifier: "GameListTableViewCell")
        
        self.view.addSubview(gameListTitle)
        self.view.addSubview(gameListTableView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        gameListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            gameListTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gameListTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            
            gameListTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gameListTableView.topAnchor.constraint(equalTo: gameListTitle.bottomAnchor, constant: 20),
            gameListTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            gameListTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            gameListTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
        ]
        constraints.forEach { $0.isActive = true }
    }
    
    private func requestData() {
        task.perform(request: gameListRequest, dataType: GameList.self) { result in
            switch result {
            case .success(let decodedData):
                DispatchQueue.main.async {
                    self.gameListDataSource = GameListTableDataSource(gameList: decodedData as! GameList)
                    self.gameListTableView.dataSource = self.gameListDataSource
                    self.gameListTableView.reloadData()
                }
            case .failure(let error):
                print("\(error) 알럿 띄워쥬기")
            }
        }
    }
    
}


