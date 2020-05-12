//
//  PlayHistoryTableViewCell.swift
//  BaseballGame
//
//  Created by delma on 2020/05/12.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class PlayHistoryTableViewCell: UITableViewCell {

    private let circleView: CircleView = {
       let view = CircleView()
        view.set(color: UIColor(named: "Yellow"))
        return view
    }()
    
    private let sequence: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
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
        super.init(style: .default, reuseIdentifier: "PlayHistoryTableViewCell")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        configureSubViews()
    }
    
    private func configureSubViews() {
        self.addSubview(circleView)
        self.addSubview(sequence)
        self.addSubview(result)
        self.addSubview(accumulatedResult)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        let constraints = [
            circleView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 4),
            circleView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            circleView.widthAnchor.constraint(equalToConstant: 10),
            circleView.heightAnchor.constraint(equalTo: circleView.widthAnchor),
            
            sequence.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 4),
            sequence.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            sequence.widthAnchor.constraint(equalTo: circleView.widthAnchor),
            sequence.heightAnchor.constraint(equalTo: sequence.widthAnchor),
            
            result.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            result.topAnchor.constraint(equalTo: circleView.topAnchor),
            
            accumulatedResult.topAnchor.constraint(equalTo: circleView.topAnchor),
            accumulatedResult.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4),
        ]
        constraints.forEach { $0.isActive = true }
        
    }
    

}
