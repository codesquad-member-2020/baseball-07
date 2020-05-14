//
//  PlayHistoryTableViewCell.swift
//  BaseballGame
//
//  Created by delma on 2020/05/12.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class PlayHistoryTableViewCell: UITableViewCell {

    static let identifier = "PlayHistoryTableViewCell"
  
    private let circleView: CircleView = {
       let view = CircleView()
        view.set(color: .lightGray)
        return view
    }()
    
    private let sequence: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let result: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let accumulatedResult: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.isUserInteractionEnabled = false
        temp()
        configureSubViews()
    }
    
    private func temp() {
        sequence.text = "12"
        result.text = "스트라이크"
        accumulatedResult.text = "S1 B2"
    }
    
    private func configureSubViews() {
        self.contentView.addSubview(circleView)
        self.contentView.addSubview(sequence)
        self.contentView.addSubview(result)
        self.contentView.addSubview(accumulatedResult)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        let constraints = [
            circleView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            circleView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),

            sequence.leadingAnchor.constraint(equalTo: circleView.leadingAnchor),
            sequence.topAnchor.constraint(equalTo: circleView.topAnchor),
            sequence.trailingAnchor.constraint(equalTo: circleView.trailingAnchor),
            sequence.bottomAnchor.constraint(equalTo: circleView.bottomAnchor),

            result.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            result.topAnchor.constraint(equalTo: circleView.topAnchor),

            accumulatedResult.topAnchor.constraint(equalTo: circleView.topAnchor),
            accumulatedResult.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
        ]
        constraints.forEach { $0.isActive = true }
        
    }
    
    func setCircleColor() {
        circleView.set(color: UIColor(named: "Yellow"))
        circleView.show()
    }
    
    override func prepareForReuse() {
        circleView.set(color: .lightGray)
    }
}
