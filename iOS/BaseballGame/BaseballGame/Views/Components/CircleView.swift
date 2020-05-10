//
//  CircleView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/10.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2.0
    }
    
    func set(color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.backgroundColor = color
    }
}
