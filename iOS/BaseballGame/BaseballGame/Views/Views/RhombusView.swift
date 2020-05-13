//
//  RhombusView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/11.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class RhombusView: UIView {

    private var color: UIColor!

    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.color = color
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
        let rhombusPath = UIBezierPath()
        let widthPoint = rect.width / 2
        let heightPoint = rect.height / 2
        let startPoint = CGPoint(x: widthPoint, y: 0)
        rhombusPath.move(to: startPoint)
        rhombusPath.addLine(to: CGPoint(x: rect.width, y: heightPoint))
        rhombusPath.addLine(to: CGPoint(x: widthPoint, y: rect.height))
        rhombusPath.addLine(to: CGPoint(x: 0, y: heightPoint))
        self.color.setFill()
        rhombusPath.fill()
    }

}
