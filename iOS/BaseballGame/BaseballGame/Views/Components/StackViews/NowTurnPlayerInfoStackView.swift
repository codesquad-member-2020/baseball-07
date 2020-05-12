//
//  NowTurnPlayerInfoStackView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/11.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class NowTurnPlayerInfoStackView: UIStackView {

    private let pitcher = OnePlayerInfoView()
    private let hitter = OnePlayerInfoView()
    private let separator: UIView = {
       let view = UIView()
        view.backgroundColor = .gray
        view.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        self.alignment = .leading
        self.axis = .vertical
        self.distribution = .fillProportionally
        self.spacing = 2
        
        addSubviews()
        configureConstraints()
    }
    
    private func addSubviews() {
           [pitcher, separator, hitter].forEach { self.addArrangedSubview($0) }
   }

    private func configureConstraints() {
        let constraints = [
            pitcher.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            
            separator.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            
            hitter.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
        ]
        
        constraints.forEach { $0.isActive = true}
        
    }
}
