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
    private let playHistoryTableView = PlayHistoryTableView()
    private var histories: [InningHistoryInfo]!
    var strikeCount = 0
    var ballCount = 0
    
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
        self.addSubview(playHistoryTableView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        let constraints = [
            playHistoryTableView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 70),
            playHistoryTableView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            playHistoryTableView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            playHistoryTableView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
        ]
        constraints.forEach { $0.isActive = true }
    }
    
    func set(histories: [InningHistoryInfo]) {
        self.histories = histories
        playHistoryTableView.dataSource = self
        playHistoryTableView.reloadData()
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
        
        if histories[indexPath.section].pitchResults[indexPath.row] == "strike" {
            strikeCount += 1
        }else if histories[indexPath.section].pitchResults[indexPath.row] == "ball" {
            ballCount += 1
        }
        
        cell.configureHitInfo(sequence: reversedSequence[indexPath.row], result: reversedResult[indexPath.row], strikeCount: strikeCount, ballCount: ballCount)
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
        strikeCount = 0
        ballCount = 0
        return "\(histories[section].hitterOrder) 타자 \(histories[section].hitter)"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
