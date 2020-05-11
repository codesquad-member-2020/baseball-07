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
    private let rhombusView = RhombusView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), color: .blue)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = #colorLiteral(red: 0.324877588, green: 0.8050840736, blue: 0.475931323, alpha: 1)
        self.addSubview(sboView)
        self.addSubview(rhombusView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        rhombusView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            sboView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            sboView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            
            rhombusView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rhombusView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            rhombusView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            rhombusView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
        ]
        constraints.forEach { $0.isActive = true }
    }
}
