//
//  SBOStackView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/10.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class SBOStackView: UIStackView {
    
    private let strike: VersusLabel = {
        let label = VersusLabel()
        label.text = "S"
        return label
    }()
    
    private let ball: VersusLabel = {
        let label = VersusLabel()
        label.text = "B"
        return label
    }()
    
    private let out: VersusLabel = {
        let label = VersusLabel()
        label.text = "O"
        return label
    }()
    private let strikeCircle: CircleView = {
        let circle = CircleView()
        circle.set(color: #colorLiteral(red: 0, green: 0.2772572788, blue: 0.712305679, alpha: 1))
        return circle
    }()
    
    private let ballCircle: CircleView = {
        let circle = CircleView()
        circle.set(color: #colorLiteral(red: 1, green: 0.5230900419, blue: 0.001250301042, alpha: 1))
        return circle
    }()
    
    private let outCircle: CircleView = {
        let circle = CircleView()
        circle.set(color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
        return circle
    }()
    
    lazy private var strikeCircleStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        for _ in 0...3 {
            stackView.addArrangedSubview(strikeCircle)
            strikeCircle.isHidden = true
        }
        return stackView
    }()
    
    lazy private var ballCircleStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        for _ in 0...3 {
            stackView.addArrangedSubview(ballCircle)
            ballCircle.isHidden = true
        }
        return stackView
    }()
    
    lazy private var outCircleStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        for _ in 0...3 {
            stackView.addArrangedSubview(outCircle)
            outCircle.isHidden = true
        }
        return stackView
    }()
    
    lazy private var strikeLabelCircleStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        stackView.addArrangedSubview(strike)
        stackView.addArrangedSubview(strikeCircleStack)
        return stackView
    }()
    
    lazy private var ballLabelCircleStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        stackView.addArrangedSubview(ball)
        stackView.addArrangedSubview(ballCircleStack)
        return stackView
    }()
    
    lazy private var outLabelCircleStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        stackView.addArrangedSubview(out)
        stackView.addArrangedSubview(outCircleStack)
        return stackView
    }()
    
    //현재 스택뷰에 애드
    
    
    
}
