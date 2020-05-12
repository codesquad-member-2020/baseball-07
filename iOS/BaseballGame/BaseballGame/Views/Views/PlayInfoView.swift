//
//  PlayInfoView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/12.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class PlayInfoView: UIView {

    let nowTurnPlayerInfoView = NowTurnPlayerInfoStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.addSubview(nowTurnPlayerInfoView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        let constraints = [
            nowTurnPlayerInfoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            nowTurnPlayerInfoView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            nowTurnPlayerInfoView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
        ]
        constraints.forEach { $0.isActive = true}
    }
    
}
