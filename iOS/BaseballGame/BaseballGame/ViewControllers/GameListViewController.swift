//
//  GameListViewController.swift
//  BaseballGame
//
//  Created by delma on 2020/05/04.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

final class GameListViewController: UIViewController {
    
    private let gameListTitle = GameListTitleLabel()
    @IBOutlet var gameListTableView: GameListTableView!
    private var gameListDataSource: GameListTableDataSource!
    private var networkIndicator: NetworkIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        requestData()
    }
    
    private func configure() {
        gameListTableView.delegate = self
        gameListTableView.register(GameListTableViewCell.self, forCellReuseIdentifier: "GameListTableViewCell")
        configureIndicator()
        configureSubviews()
        configureConstraints()
        configureObservers()
    }
    
    private func configureIndicator() {
        let width = view.frame.width / 8
        networkIndicator = NetworkIndicator(frame: CGRect(x: view.center.x - width / 2,
                                                          y: view.center.y - width / 2,
                                                          width: width,
                                                          height: width),
                                            image: UIImage(named: "99.png"))
        networkIndicator.startAnimating()
    }
    
    private func configureSubviews() {
        self.view.addSubview(gameListTitle)
        self.view.addSubview(gameListTableView)
        self.view.addSubview(networkIndicator)
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
    
    private func configureObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(showErrorAlert(_:)), name: .networkError, object: nil)
    }
    
    @objc private func showErrorAlert(_ notification: Notification) {
        guard let error = notification.userInfo?["error"] as? Error else { return }
        let alert = AppDelegate.errorAlert
        alert.set(message: error as! NetworkError)
        alert.makeDefaultAction {
            self.requestData()
        }
        present(alert, animated: true)
    }
    
    private func requestData() {
        GameListUseCase().requestGameList { decodedData in
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
        let gameId = gameListDataSource.getGameId(indexPath.row)
        GameRoomInfoUseCase().requestGameRoomInfo(gameId: gameId) { decodedData in
            DispatchQueue.main.async {
                self.judge(decodedData as! GameRoomEmpty, gameId: gameId)
            }
        }
    }
    
    private func judge(_ gameRoomEmpty: GameRoomEmpty, gameId: Int) {
        if !gameRoomEmpty.homeTeamEmpty, !gameRoomEmpty.awayTeamEmpty {
            roomFullAlert()
        }else {
            makeActionSheet(home: gameRoomEmpty.homeTeamEmpty ? gameRoomEmpty.homeTeam : nil, away: gameRoomEmpty.awayTeamEmpty ? gameRoomEmpty.awayTeam : nil, gameId: gameId)
        }
    }
    
    private func roomFullAlert() {
        let alert = UIAlertController(title: "알림", message: "방이 꽉찼어요", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default) { _ in })
        present(alert, animated: true)
    }
    
    private func makeActionSheet(home: String?, away: String?, gameId: Int) {
        let actionSheet = UIAlertController(title: "입장", message: "팀을 선택해주세요", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "취소", style: .cancel) { _ in }
        
        if let homeTeamName = home {
            let homeTeam = UIAlertAction(title: homeTeamName, style: .default) { _ in
                self.moveToNext(gameId: gameId, teamName: homeTeamName)
            }
            actionSheet.addAction(homeTeam)
        }
        
        if let awayTeamName = away {
            let awayTeam = UIAlertAction(title: awayTeamName, style: .default) { _ in
                self.moveToNext(gameId: gameId, teamName: awayTeamName)
            }
            actionSheet.addAction(awayTeam)
        }
        actionSheet.addAction(cancel)
        present(actionSheet, animated: true)
    }
    
    private func moveToNext(gameId: Int, teamName: String) {
        RoomEnterAvailableUseCase().requestRoomEnterAvailable(gameId: gameId, teamName: teamName) { decodedData in
            guard let result = decodedData as? EnterRequest else { return }
            switch result.result {
            case "ok" :
                guard let playViewController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") else { return }
                self.present(playViewController, animated: true)
            case "fail" :
                self.roomFullAlert()
            default:
                break
            }
        }
    }
}
