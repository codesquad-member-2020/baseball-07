//
//  HomeView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/11.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class HomeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func draw(_ rect: CGRect) {
        let homePath = UIBezierPath()
        let widthPoint = rect.width / 2
        let heightPoint = rect.height / 2
        let startPoint = CGPoint(x: widthPoint, y: 0)
        homePath.move(to: startPoint)
        homePath.addLine(to: CGPoint(x: rect.width, y: heightPoint))
        homePath.addLine(to: CGPoint(x: rect.width, y: rect.height))
        homePath.addLine(to: CGPoint(x: widthPoint, y: rect.height))
        homePath.addLine(to: CGPoint(x: 0, y: rect.height))
        homePath.addLine(to: CGPoint(x: 0, y: heightPoint))
        UIColor.white.setFill()
        homePath.fill()
    }

}
