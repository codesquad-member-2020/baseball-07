//
//  PlayViewController.swift
//  BaseballGame
//
//  Created by delma on 2020/05/09.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    private let gameHeaderView = GameHeaderView()
    private let gameFieldView = GameFieldView()
    private let inningCollectionView = InningCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        configureSubViews()
        configureCollectionView()
        configureConstraints()
    }
    
    private func configureSubViews() {
        self.view.addSubview(gameHeaderView)
        self.view.addSubview(gameFieldView)
        self.view.addSubview(inningCollectionView)
    }
    
    private func configureCollectionView() {
        inningCollectionView.register(InningCollectionViewCell.self, forCellWithReuseIdentifier: "InningCollectionViewCell")
        inningCollectionView.dataSource = self
        inningCollectionView.delegate = self
    }
    
    private func configureConstraints() {
        let constraints = [
            gameHeaderView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            gameHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
            gameHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),
            
            gameFieldView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            gameFieldView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            gameFieldView.topAnchor.constraint(equalTo: gameHeaderView.bottomAnchor, constant: 5),
            gameFieldView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 3),
            
        ]
        constraints.forEach { $0.isActive = true }
    }
}

extension PlayViewController: UICollectionViewDataSource {
    // TODO: - 각 회차별 정보 가지고 있는 모델 필요. 연장전 갈수도 있으므로 셀 추가되어야 함.
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InningCollectionViewCell", for: indexPath) as! InningCollectionViewCell
        cell.set(inning: indexPath.row + 1)
        return cell
    }
    
    
}

extension PlayViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InningCollectionViewCell", for: indexPath) as! InningCollectionViewCell
        cell.selected()
        // TODO: - 하단에 뷰 생성해서 걔한테 [1회] 셀이 선택되었다는 거 알려줘야 함
    }
}
