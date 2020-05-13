//
//  GameHeaderView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/09.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

@IBDesignable
class GameHeaderView: UIView {
    let visitingTeamName = GameListTitleLabel()
    let visitingTeamScore = GameListTitleLabel()
    
    let homeTeamName = GameListTitleLabel()
    let homeTeamScore = GameListTitleLabel()
    
    let versus = VersusLabel()
    let inningInfo = UILabel()
    let homeTeamTurn = UIView()
    let visitingTeamTurn = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
     
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        temp()
        configureVersus()
        configureScore()
        configureInningInfo()
        configureTeamName()
        configureSubviews()
        configureTurnBar()
    }
    
    private func temp() {
        homeTeamScore.text = "10"
        visitingTeamScore.text = "15"
        homeTeamName.text = "Home"
        visitingTeamName.text = "Visiting"
        inningInfo.text = "2회초 수비"
    }
    
    private func configureVersus() {
        versus.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
    }
    
    private func configureScore() {
        homeTeamScore.textColor = .black
        visitingTeamScore.textColor = .black
        
        homeTeamScore.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        visitingTeamScore.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
    }
    
    private func configureInningInfo() {
        inningInfo.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    private func configureTeamName() {
        homeTeamName.font = UIFont(name: "HelveticaNeue-Bold", size: 32)
        visitingTeamName.font = UIFont(name: "HelveticaNeue-Bold", size: 32)
    }
    
    private func configureTurnBar() {
        homeTeamTurn.backgroundColor = UIColor(named: "Yellow")
        visitingTeamTurn.backgroundColor = UIColor(named: "Yellow")
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
            versus.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            
            inningInfo.centerXAnchor.constraint(equalTo: versus.centerXAnchor),
            inningInfo.topAnchor.constraint(equalTo: versus.bottomAnchor, constant: 4),
            inningInfo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            visitingTeamScore.trailingAnchor.constraint(equalTo: inningInfo.leadingAnchor, constant: -15),
            visitingTeamScore.bottomAnchor.constraint(equalTo: versus.bottomAnchor),
            
            visitingTeamName.trailingAnchor.constraint(equalTo: visitingTeamScore.leadingAnchor, constant: -8),
            visitingTeamName.centerYAnchor.constraint(equalTo: versus.centerYAnchor),
            visitingTeamName.bottomAnchor.constraint(equalTo: versus.bottomAnchor),

            visitingTeamTurn.leadingAnchor.constraint(equalTo: visitingTeamName.leadingAnchor),
            visitingTeamTurn.trailingAnchor.constraint(equalTo: visitingTeamScore.trailingAnchor),
            visitingTeamTurn.heightAnchor.constraint(equalToConstant: 5.0),
            visitingTeamTurn.topAnchor.constraint(equalTo: inningInfo.topAnchor),
            
            homeTeamScore.leadingAnchor.constraint(equalTo: inningInfo.trailingAnchor, constant: 15),
            homeTeamScore.bottomAnchor.constraint(equalTo: versus.bottomAnchor),
            
            homeTeamName.leadingAnchor.constraint(equalTo: homeTeamScore.trailingAnchor, constant: 8),
            homeTeamName.centerYAnchor.constraint(equalTo: versus.centerYAnchor),
            homeTeamName.bottomAnchor.constraint(equalTo: versus.bottomAnchor),

            homeTeamTurn.leadingAnchor.constraint(equalTo: homeTeamScore.leadingAnchor),
            homeTeamTurn.trailingAnchor.constraint(equalTo: homeTeamName.trailingAnchor),
            homeTeamTurn.heightAnchor.constraint(equalToConstant: 5.0),
            homeTeamTurn.topAnchor.constraint(equalTo: inningInfo.topAnchor),
        ]
        
        constraints.forEach { $0.isActive = true }
    }
    
    
    
}
