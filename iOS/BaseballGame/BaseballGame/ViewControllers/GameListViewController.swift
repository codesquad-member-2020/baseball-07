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
    private var gameListViewModel = GameListViewModel() { _ in }
    
    private let gameListRequest = MockGameListRequest()
    private let dispatcher = NetworkDispatcher()
    private lazy var task = NetworkTask(dispatcher: dispatcher)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        requestData()
    }
    
    private func configure() {
        gameListTableView.dataSource = self.gameListViewModel
        gameListTableView.register(GameListTableViewCell.self, forCellReuseIdentifier: "GameListTableViewCell")
        
        self.view.addSubview(gameListTitle)
        self.view.addSubview(gameListTableView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        gameListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            gameListTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gameListTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
            
            gameListTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gameListTableView.topAnchor.constraint(equalTo: gameListTitle.bottomAnchor, constant: 20),
            gameListTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            gameListTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            gameListTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ]
        constraints.forEach { $0.isActive = true }
    }
    
    private func requestData() {
        task.perform(request: gameListRequest, dataType: GameList.self) { result in
            switch result {
            case .success(let decodedData):
                DispatchQueue.main.async {
                    self.gameListViewModel.set(gameList: decodedData as! GameList)
                    self.gameListTableView.reloadData()
                }
            case .failure(let error):
                print("\(error) 알럿 띄워쥬기")
            }
        }
    }
    
}


