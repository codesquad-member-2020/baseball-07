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
        configureConstraints()
    }
    
    private func configureConstraints() {
        let constraints = [
            sboView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            sboView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
        ]
        constraints.forEach { $0.isActive = true }
    }
}
