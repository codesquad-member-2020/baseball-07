//
//  InningCollectionViewCell.swift
//  BaseballGame
//
//  Created by delma on 2020/05/12.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class InningCollectionViewCell: UICollectionViewCell {
    static let identifier = "InningCollectionViewCell"
    private let inning: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = UIColor(named: "Navy")
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.contentView.addSubview(inning)
        self.backgroundColor = UIColor(named: "Navy")
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        configureConstraints()
    }
    
    private func configureConstraints() {
        let constraints = [
            inning.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            inning.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
        ]
        constraints.forEach { $0.isActive = true}
    }
    
    override func prepareForReuse() {
        deselected()
    }
    
    func set(inning: Int) {
        self.inning.text = "\(inning) 회"
    }
    
    func selected() {
        inning.textColor = UIColor(named: "Navy")
        inning.backgroundColor = .white
        self.backgroundColor = .white
        
    }
    
    func deselected() {
        inning.textColor = .white
        inning.backgroundColor = UIColor(named: "Navy")
        self.backgroundColor = UIColor(named: "Navy")
    }
    
    
}
