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
    private var networkIndicator: NetworkIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        networkIndicator.startAnimating()
        requestData()
    }
    
    private func configure() {
        let width = view.frame.width / 8
        networkIndicator = NetworkIndicator(frame: CGRect(x: view.center.x - width / 2, y: view.center.y - width / 2, width: width, height: width), image: UIImage(named: "99.png"))
        gameListTableView.register(GameListTableViewCell.self, forCellReuseIdentifier: "GameListTableViewCell")
        
        self.view.addSubview(gameListTitle)
        self.view.addSubview(gameListTableView)
        self.view.addSubview(networkIndicator)
        
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
        NetworkUseCase.requestFakeGameList { decodedData in
            DispatchQueue.main.async {
                self.gameListDataSource = GameListTableDataSource(gameList: decodedData as! GameList)
                self.gameListTableView.dataSource = self.gameListDataSource
                self.gameListTableView.reloadData()
                self.networkIndicator.stopAnimating()
            }
        }
        
    }
    
}

extension GameListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //server에 해당 방 비었는지 요청 후 true / false 로 받아 true일때 알럿 띄워 홈/원정 선택 후 방 입장..
    }
}
