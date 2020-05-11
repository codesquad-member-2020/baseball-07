//
//  GameFieldView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/10.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class GameFieldView: UIView {
    
    private let sboView = SBOView()
    private let groundView = GroundView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(named: "Green")
        self.addSubview(sboView)
        self.addSubview(groundView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        let constraints = [
            sboView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            sboView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            
            groundView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            groundView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            groundView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            groundView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
        ]
        constraints.forEach { $0.isActive = true }
    }
}
