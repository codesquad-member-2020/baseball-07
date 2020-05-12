//
//  InningCollectionViewCell.swift
//  BaseballGame
//
//  Created by delma on 2020/05/12.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class InningCollectionViewCell: UICollectionViewCell {
    private let inning: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.backgroundColor = UIColor(named: "Navy")
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.contentView.addSubview(inning)
        configureConstraints()
    }
    
    private func configureConstraints() {
        let constraints = [
            inning.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            inning.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 4),
            inning.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4),
            inning.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
        ]
        constraints.forEach { $0.isActive = true}
    }
    
    func set(inning: String) {
        self.inning.text = inning
    }
    
    func selected() {
        inning.textColor = UIColor(named: "Navy")
        inning.backgroundColor = .clear
    }
}
