//
//  OnePlayerInfoView.swift
//  BaseballGame
//
//  Created by delma on 2020/05/11.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class OnePlayerInfoView: UIView {

    private let role: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playerName: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let info: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor(named: "Navy")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let checkMark: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "checkmark")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isOpaque = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.addSubview(role)
        self.addSubview(playerName)
        self.addSubview(info)
        self.addSubview(checkMark)
        
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
        configureConstraints()
        temp()
    }
    
    private func temp() {
        role.text = "투수"
        playerName.text = "박보검"
        info.text = "1타석 2안타"
        showCheckMarker()
    }
    
    private func configureConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            role.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            role.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            
            playerName.topAnchor.constraint(equalTo: role.topAnchor),
            
            info.leadingAnchor.constraint(equalTo: playerName.trailingAnchor, constant: 14),
            info.topAnchor.constraint(equalTo: role.topAnchor),
            
            checkMark.leadingAnchor.constraint(equalTo: info.trailingAnchor, constant: 14),
            checkMark.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            checkMark.topAnchor.constraint(equalTo: role.topAnchor),
            checkMark.bottomAnchor.constraint(equalTo: role.bottomAnchor),
        ]
        constraints.forEach { $0.isActive = true }
    }
    
    func set(role: String) {
        self.role.text = role
    }
    
    func set(playerName: String) {
        self.playerName.text = playerName
    }
    
    func set(info: String) {
        self.info.text = info
    }
    
    func showCheckMarker() {
        checkMark.isOpaque = false
    }
    
}
