//
//  LabelCircleStackView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/10.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class LabelCircleStackView: UIStackView {
   
    private let label = VersusLabel()
    
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
        self.distribution = .fillProportionally
        self.spacing = 2
    }

    func set(text: String) {
        label.text = text
    }
}
