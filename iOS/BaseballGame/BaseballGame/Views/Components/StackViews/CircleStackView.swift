//
//  CircleStackView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/10.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class CircleStackView: UIStackView {
   
    private let firstCircle = CircleView()
    private let secondCircle = CircleView()
    private let thirdCircle = CircleView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alignment = .leading
        self.axis = .horizontal
        self.distribution = .fillProportionally
        self.spacing = 2
        addSubviews()
    }
    
    private func addSubviews() {
        [firstCircle, secondCircle, thirdCircle].forEach { self.addArrangedSubview($0) }
    }
    
    func set(color: UIColor) {
        [firstCircle, secondCircle, thirdCircle].forEach { $0.set(color: color) }
    }
   
}
