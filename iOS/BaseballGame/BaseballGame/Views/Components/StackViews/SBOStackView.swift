//
//  SBOStackView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/10.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class SBOStackView: UIStackView {
    
    private let strikeCircleStack: CircleStackView = {
        let stackView = CircleStackView()
        stackView.set(circleViewColor: #colorLiteral(red: 0, green: 0.2772572788, blue: 0.712305679, alpha: 1))
        return stackView
    }()
    
    private let ballCircleStack: CircleStackView = {
        let stackView = CircleStackView()
        stackView.set(circleViewColor: #colorLiteral(red: 1, green: 0.5230900419, blue: 0.001250301042, alpha: 1))
        return stackView
    }()
    
    private let outCircleStack: CircleStackView = {
        let stackView = CircleStackView()
        stackView.set(circleViewColor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
        return stackView
    }()
    
    lazy private var strikeLabelCircleStack: LabelCircleStackView = {
        let stackView = LabelCircleStackView()
        stackView.set(text: "S")
        stackView.addArrangedSubview(strikeCircleStack)
        return stackView
    }()
    
    lazy private var ballLabelCircleStack: LabelCircleStackView = {
        let stackView = LabelCircleStackView()
        stackView.set(text: "B")
        stackView.addArrangedSubview(ballCircleStack)
        return stackView
    }()
    
    lazy private var outLabelCircleStack: LabelCircleStackView = {
        let stackView = LabelCircleStackView()
        stackView.set(text: "O")
        stackView.addArrangedSubview(outCircleStack)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.alignment = .center
        self.axis = .vertical
        self.distribution = .fillEqually
        self.spacing = 2
        self.addArrangedSubview(strikeLabelCircleStack)
        self.addArrangedSubview(ballLabelCircleStack)
        self.addArrangedSubview(outLabelCircleStack)
    }
}
