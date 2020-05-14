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
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        label.textColor = .black
        return label
    }()
    
    private let ball: VersusLabel = {
        let label = VersusLabel()
        label.text = "B"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        label.textColor = .black
        return label
    }()
    
    private let out: VersusLabel = {
        let label = VersusLabel()
        label.text = "O"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        label.textColor = .black
        return label
    }()
    
    private let strikeCircleStack: CircleStackView = {
       let stack = CircleStackView()
        stack.set(color: #colorLiteral(red: 0.006796875347, green: 0.2596735749, blue: 0.8284620876, alpha: 1))
        return stack
    }()
    private let ballCircleStack: CircleStackView = {
       let stack = CircleStackView()
        stack.set(color: #colorLiteral(red: 1, green: 0.5717964641, blue: 0, alpha: 1))
        return stack
    }()
    private let outCircleStack: CircleStackView = {
       let stack = CircleStackView()
        stack.set(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
        return stack
    }()
    
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
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            strike.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            strike.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            strike.heightAnchor.constraint(equalTo: strikeCircleStack.heightAnchor),
            
            strikeCircleStack.topAnchor.constraint(equalTo: strike.topAnchor),
            strikeCircleStack.leadingAnchor.constraint(equalTo: strike.trailingAnchor, constant: 4),
            strikeCircleStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            
            ball.topAnchor.constraint(equalTo: strike.bottomAnchor, constant: 4),
            ball.leadingAnchor.constraint(equalTo: strike.leadingAnchor),
            
            ballCircleStack.topAnchor.constraint(equalTo: ball.topAnchor),
            ballCircleStack.leadingAnchor.constraint(equalTo: ball.trailingAnchor, constant: 4),
            ballCircleStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            ballCircleStack.bottomAnchor.constraint(equalTo: ball.bottomAnchor),
            
            out.topAnchor.constraint(equalTo: ball.bottomAnchor, constant: 4),
            out.leadingAnchor.constraint(equalTo: ball.leadingAnchor),
            
            outCircleStack.topAnchor.constraint(equalTo: out.topAnchor),
            outCircleStack.leadingAnchor.constraint(equalTo: out.trailingAnchor, constant: 4),
            outCircleStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            outCircleStack.bottomAnchor.constraint(equalTo: out.bottomAnchor),
        ]
        constraints.forEach { $0.isActive = true }
    }
    
    func configureStrike(_ count: Int) {
        for index in 0...count {
            guard let circle = strikeCircleStack.subviews[index] as? CircleView else { return }
            circle.show()
        }
    }
    
    func configureBall(_ count: Int) {
        for index in 0...count {
            guard let circle = ballCircleStack.subviews[index] as? CircleView else { return }
            circle.show()
        }
    }
    
    func configureOut(_ count: Int) {
        for index in 0...count {
            guard let circle = outCircleStack.subviews[index] as? CircleView else { return }
            circle.show()
        }
    }
}
