//
//  CircleStackView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/10.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class CircleStackView: UIStackView {
    
    private let circleView = CircleView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.alignment = .center
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = 2
        
        for _ in 0...3 {
            self.addArrangedSubview(circleView)
            circleView.isHidden = true
        }
    }
    
    func set(circleViewColor: UIColor) {
        circleView.set(color: circleViewColor)
    }
}
