//
//  PitchButton.swift
//  BaseballGame
//
//  Created by delma on 2020/05/11.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class PitchButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(named: "Orange")
        self.setTitle("PITCH", for: .normal)
        self.setTitleColor(.darkGray, for: .normal)
        self.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        self.layer.cornerRadius = 6.0
        self.layer.masksToBounds = true
    }
}
