//
//  GroundView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/11.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class GroundView: UIView {
    
    private let rhombusView = RhombusView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), color: UIColor(named: "Yellow")!)
    private let firstBase = RhombusView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    private let secondBase = RhombusView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    private let thirdBase = RhombusView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        configureSubViews()
    }
    
    private func configureSubViews() {
        self.addSubview(rhombusView)
        self.addSubview(firstBase)
        self.addSubview(secondBase)
        self.addSubview(thirdBase)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        
        let constraints = [
            firstBase.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
            firstBase.heightAnchor.constraint(equalTo: firstBase.widthAnchor),
            
            secondBase.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
            secondBase.heightAnchor.constraint(equalTo: secondBase.widthAnchor),
            
            thirdBase.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
            thirdBase.heightAnchor.constraint(equalTo: thirdBase.widthAnchor),
            
            firstBase.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: firstBase.frame.height / 2 ),
            firstBase.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            secondBase.topAnchor.constraint(equalTo: self.topAnchor, constant: secondBase.frame.height / 2),
            secondBase.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            thirdBase.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -(thirdBase.frame.width / 2)),
            thirdBase.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            rhombusView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rhombusView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            rhombusView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            rhombusView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9)
        ]
        constraints.forEach{ $0.isActive = true }
    }
    

}
