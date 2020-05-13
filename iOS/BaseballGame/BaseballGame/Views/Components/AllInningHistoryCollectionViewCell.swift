//
//  AllInningHistoryCollectionViewCell.swift
//  BaseballGame
//
//  Created by delma on 2020/05/12.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class AllInningHistoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AllInningHistoryCollectionViewCell"
    private let nowTurnPlayerInfoView = NowTurnPlayerInfoStackView()
    private let playHistoryTableView = PlayHistoryTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        playHistoryTableView.register(PlayHistoryTableViewCell.self, forCellReuseIdentifier: PlayHistoryTableViewCell.identifier)
        playHistoryTableView.delegate = self
        playHistoryTableView.dataSource = self
        playHistoryTableView.separatorStyle = .none
        configureSubViews()
    }
    
    private func configureSubViews() {
        self.addSubview(nowTurnPlayerInfoView)
        self.addSubview(playHistoryTableView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        let constraints = [
            nowTurnPlayerInfoView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 22),
            nowTurnPlayerInfoView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 26),
            nowTurnPlayerInfoView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -26),
            
            playHistoryTableView.topAnchor.constraint(equalTo: nowTurnPlayerInfoView.bottomAnchor, constant: 28),
            playHistoryTableView.leadingAnchor.constraint(equalTo: self.nowTurnPlayerInfoView.leadingAnchor),
            playHistoryTableView.trailingAnchor.constraint(equalTo: nowTurnPlayerInfoView.trailingAnchor),
            playHistoryTableView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
        ]
        constraints.forEach { $0.isActive = true }
        
    }
    
}

extension AllInningHistoryCollectionViewCell: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: - 각각의 데이터 넣어줘야함.
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayHistoryTableViewCell", for: indexPath) as! PlayHistoryTableViewCell
        if indexPath.section == 0 { cell.setCircleColor() }
        return cell
    }
}

extension AllInningHistoryCollectionViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(section+1) 타자 류현진"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
