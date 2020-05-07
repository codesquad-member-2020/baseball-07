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
    private let gameListTableView = GameListTableView()
//    private let gameListDataSource = GameListTableDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureConstraints()
//        gameListTableView.dataSource = gameListDataSource
       
        let gameListRequest = MockGameListRequest()
        let mockDispatcher = NetworkDispatcher()
        let task = NetworkTask(dispatcher: mockDispatcher)
        task.perform(request: gameListRequest, dataType: GameList.self) { result in
            switch result {
            case .success(let decodedData):
                print("뷰모델에 넣어주고 할일 해 ")
            case .failure(let error):
                print("error 알럿 띄워쥬기")
            }
        }
    }
    
    private func addSubViews() {
        self.view.addSubview(gameListTitle)
        self.view.addSubview(gameListTableView)
    }
    
    private func configureConstraints() {
        let constraints = [
            gameListTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gameListTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
            
            gameListTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            gameListTableView.topAnchor.constraint(equalTo: gameListTitle.bottomAnchor, constant: 20),
            gameListTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
        ]
        constraints.forEach { $0.isActive = true }
    }
    
}
