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
    private let homeView = HomeView()
    private lazy var bases = [firstBase, secondBase, thirdBase]
    
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
        bases.forEach { self.addSubview($0)}
        self.addSubview(homeView)
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
            
            homeView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
            homeView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.15),
            
            firstBase.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            firstBase.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            secondBase.topAnchor.constraint(equalTo: self.topAnchor),
            secondBase.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            thirdBase.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            thirdBase.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            homeView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            homeView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            rhombusView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rhombusView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            rhombusView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            rhombusView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
        ]
        constraints.forEach{ $0.isActive = true }
    }
    
    func occupy(_ count: Int) {
        guard count > 0 else { return }
         for index in 1...count {
            bases[index-1].change(color: UIColor(named: "Orange"))
            bases[index-1].setNeedsDisplay()
        }
    }

}
