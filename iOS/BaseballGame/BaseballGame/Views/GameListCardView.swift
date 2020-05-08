//
//  GameListCardView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/06.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class GameListCardView: UIView {
    
    private let homeTeam = ParticipantLabel()
    private let visitingTeam = ParticipantLabel()
    private let versus = VersusLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBackgroundColor()
        addSubViews()
        configureConstraints()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureBackgroundColor() {
        self.backgroundColor = #colorLiteral(red: 1, green: 0.730245653, blue: 0, alpha: 1)
    }
    
    private func addSubViews() {
        self.addSubview(homeTeam)
        self.addSubview(versus)
        self.addSubview(visitingTeam)
    }
    
    private func configureConstraints() {
        let constraints = [
            versus.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            versus.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            visitingTeam.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            visitingTeam.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            visitingTeam.trailingAnchor.constraint(equalTo: versus.leadingAnchor, constant: -10),
            visitingTeam.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),

            homeTeam.topAnchor.constraint(equalTo: visitingTeam.topAnchor),
            homeTeam.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            homeTeam.leadingAnchor.constraint(equalTo: versus.trailingAnchor, constant: 10),
            homeTeam.bottomAnchor.constraint(equalTo: visitingTeam.bottomAnchor),
        ]
        
        constraints.forEach { $0.isActive = true }
    }
    
    func setHomeTeam(_ text: String) {
        homeTeam.text = text
    }
    
    func setVisitingTeam(_ text: String) {
        visitingTeam.text = text
    }
    
    
}
