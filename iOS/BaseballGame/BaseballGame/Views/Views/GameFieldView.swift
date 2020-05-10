//
//  GameFieldView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/10.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class GameFieldView: UIView {

    private let sboStackView = SBOStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = #colorLiteral(red: 0.2715155955, green: 0.6766338832, blue: 0.3527343206, alpha: 1)
        self.addSubview(sboStackView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        let constraints = [
            sboStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            sboStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            sboStackView.widthAnchor.constraint(equalToConstant: 200),
            
            sboStackView.heightAnchor.constraint(equalToConstant: 150),
        ]
        
        constraints.forEach { $0.isActive = true }
    }
    
}
