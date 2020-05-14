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
        self.widthAnchor.constraint(equalToConstant: 18).isActive = true
        self.heightAnchor.constraint(equalToConstant: 18).isActive = true
        self.layer.cornerRadius = 9
        self.clipsToBounds = true
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2.0
        self.alpha = 0.0
    }
 
    func set(color: UIColor?) {
        self.layer.borderColor = color?.cgColor
        self.backgroundColor = color
    }
    
    func show() {
        self.alpha = 1.0
    }
    
    func hide() {
        self.alpha = 0.0
    }
}
