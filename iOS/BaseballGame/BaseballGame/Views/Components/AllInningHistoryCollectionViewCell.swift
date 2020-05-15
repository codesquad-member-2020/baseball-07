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
    private let infoView: UILabel = {
       let label = UILabel()
        label.text = "아직 게임 정보가 없어요!"
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let playHistoryTableView = PlayHistoryTableView()
    private var histories: [InningHistoryInfo]!
    
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
        playHistoryTableView.separatorStyle = .none
        configureSubViews()
    }
    
    private func configureSubViews() {
        self.addSubview(infoView)
        self.addSubview(playHistoryTableView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        let constraints = [
            infoView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 100),
            infoView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            
            playHistoryTableView.topAnchor.constraint(equalTo: self.infoView.bottomAnchor, constant: 0),
            playHistoryTableView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            playHistoryTableView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            playHistoryTableView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
        ]
        constraints.forEach { $0.isActive = true }
    }
    
    override func prepareForReuse() {
        infoView.isHidden = false
        playHistoryTableView.isHidden = true
    }
    
    func set(histories: [InningHistoryInfo]) {
        self.histories = histories
        playHistoryTableView.dataSource = self
        playHistoryTableView.isHidden = false
        playHistoryTableView.reloadData()
    }
    
    func showInfoView() {
        infoView.isHidden = false
    }
}

extension AllInningHistoryCollectionViewCell: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return histories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return histories[section].pitchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayHistoryTableViewCell", for: indexPath) as! PlayHistoryTableViewCell
        if indexPath.section == 0 { cell.setCircleColor() }
        
        let reversedSequence = makeReversedArray(indexPath: indexPath)
        let reversedResult = histories[indexPath.section].pitchResults.reversed() as [String]
        
        cell.configureHitInfo(sequence: reversedSequence[indexPath.row], result: reversedResult[indexPath.row], strikeCount: 0, ballCount: 0)
        return cell
    }
    
    private func makeReversedArray(indexPath: IndexPath) -> [Int] {
        var sequence: [Int] = []
        for index in 0..<histories[indexPath.section].pitchResults.count {
            sequence.append(index)
        }
        return sequence.reversed() as [Int]
    }
}

extension AllInningHistoryCollectionViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(histories[section].hitterOrder) 타자 \(histories[section].hitter)"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
