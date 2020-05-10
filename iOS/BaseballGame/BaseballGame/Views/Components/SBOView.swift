//
//  SBOView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/10.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class SBOView: UIView {

    private let strike: VersusLabel = {
       let label = VersusLabel()
        label.text = "S"
        return label
    }()
    
    private let ball: VersusLabel = {
       let label = VersusLabel()
        label.text = "B"
        return label
    }()
    
    private let out: VersusLabel = {
       let label = VersusLabel()
        label.text = "O"
        return label
    }()
    
    private let strikeCircleStack = CircleStackView()
    private let ballCircleStack = CircleStackView()
    private let outCircleStack = CircleStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func configure() {
        configureSubview()
    }
    
    private func configureSubview() {
        self.addSubview(strike)
        self.addSubview(ball)
        self.addSubview(out)
        
        self.addSubview(strikeCircleStack)
        self.addSubview(ballCircleStack)
        self.addSubview(outCircleStack)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        let constraints = [
        strike.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
        strike.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
        
        strikeCircleStack.topAnchor.constraint(equalTo: strike.topAnchor),
        strikeCircleStack.leadingAnchor.constraint(equalTo: strike.trailingAnchor, constant: 4),
        
        ball.topAnchor.constraint(equalTo: strike.bottomAnchor, constant: 4),
        ball.leadingAnchor.constraint(equalTo: strike.leadingAnchor),
        
        ballCircleStack.topAnchor.constraint(equalTo: ball.topAnchor),
        ballCircleStack.leadingAnchor.constraint(equalTo: ball.trailingAnchor, constant: 4),
        
        out.topAnchor.constraint(equalTo: ball.bottomAnchor, constant: 4),
        out.leadingAnchor.constraint(equalTo: ball.leadingAnchor),
        
        outCircleStack.topAnchor.constraint(equalTo: out.topAnchor),
        outCircleStack.leadingAnchor.constraint(equalTo: out.trailingAnchor, constant: 4),

        ]
        constraints.forEach { $0.isActive = true }
    }
    
    func addStrikeCircle(color: UIColor) {
        let circle = CircleView()
        circle.set(color: color)
        strikeCircleStack.addArrangedSubview(circle)
    }
    
    func addBallCircle(color: UIColor) {
        let circle = CircleView()
        circle.set(color: color)
        ballCircleStack.addArrangedSubview(circle)
    }

    func addOutCircle(color: UIColor) {
        let circle = CircleView()
        circle.set(color: color)
        outCircleStack.addArrangedSubview(circle)
    }
    
}
