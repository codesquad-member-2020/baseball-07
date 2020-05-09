//
//  GameHeaderView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/09.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class GameHeaderView: UIView {
    let visitingTeamName = GameListTitle()
    let visitingTeamScore = GameListTitle()
    
    let homeTeamName = GameListTitle()
    let homeTeamScore = GameListTitle()
    
    let versus = VersusLabel()
    let inningInfo = UILabel()
    let homeTeamTurn = UIView()
    let visitingTeamTurn = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        configureInningInfo()
        configureTeamName()
        configureSubviews()
        configureTurnBar()
    }
    
    private func configureInningInfo() {
        inningInfo.font = UIFont.boldSystemFont(ofSize: 22)
        inningInfo.textColor = .darkGray
    }
    
    private func configureTeamName() {
        homeTeamName.font = UIFont(name: "HelveticaNeue-Bold", size: 34)
        visitingTeamName.font = UIFont(name: "HelveticaNeue-Bold", size: 34)
    }
    
    private func configureTurnBar() {
        homeTeamTurn.backgroundColor = #colorLiteral(red: 0.9930995107, green: 0.7436458176, blue: 0.2065552208, alpha: 1)
        visitingTeamTurn.backgroundColor = #colorLiteral(red: 0.9930995107, green: 0.7436458176, blue: 0.2065552208, alpha: 1)
    }
    
    private func configureSubviews() {
        self.addSubview(homeTeamName)
        self.addSubview(homeTeamScore)
        self.addSubview(visitingTeamName)
        self.addSubview(visitingTeamScore)
        self.addSubview(versus)
        self.addSubview(inningInfo)
        self.addSubview(homeTeamTurn)
        self.addSubview(visitingTeamTurn)
        configureConstraints()
    }
    
    private func configureConstraints() {
        inningInfo.translatesAutoresizingMaskIntoConstraints = false
        homeTeamTurn.translatesAutoresizingMaskIntoConstraints = false
        visitingTeamTurn.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            versus.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            versus.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            versus.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            inningInfo.centerXAnchor.constraint(equalTo: versus.centerXAnchor),
            
            visitingTeamScore.trailingAnchor.constraint(equalTo: inningInfo.leadingAnchor, constant: -10),
            visitingTeamName.trailingAnchor.constraint(equalTo: visitingTeamScore.leadingAnchor, constant: -15),
            visitingTeamName.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            visitingTeamTurn.leadingAnchor.constraint(equalTo: visitingTeamName.leadingAnchor),
            visitingTeamTurn.trailingAnchor.constraint(equalTo: visitingTeamScore.trailingAnchor),
            visitingTeamTurn.heightAnchor.constraint(equalToConstant: 5.0),
            visitingTeamTurn.topAnchor.constraint(equalTo: visitingTeamName.bottomAnchor, constant: 5),
            visitingTeamTurn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            homeTeamScore.leadingAnchor.constraint(equalTo: inningInfo.trailingAnchor, constant: 10),
            homeTeamName.leadingAnchor.constraint(equalTo: versus.leadingAnchor, constant: 15),
            homeTeamName.topAnchor.constraint(equalTo: visitingTeamName.topAnchor),
            homeTeamTurn.leadingAnchor.constraint(equalTo: homeTeamScore.leadingAnchor),
            homeTeamTurn.trailingAnchor.constraint(equalTo: homeTeamName.trailingAnchor),
            homeTeamTurn.heightAnchor.constraint(equalToConstant: 5.0),
            homeTeamTurn.topAnchor.constraint(equalTo: visitingTeamTurn.topAnchor),
            homeTeamTurn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
        ]
        
        constraints.forEach { $0.isActive = true }
    }
    
    
    
}
