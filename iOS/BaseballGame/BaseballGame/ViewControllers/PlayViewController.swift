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
    private var inningCollectionView: InningCollectionView!
    private let inningDataSource = InningCollectionViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        configureCollectionView()
        configureSubViews()
        configureConstraints()
    }
    
    private func configureCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: view.frame.width / 3, height: 30)
        layout.scrollDirection = .horizontal
        inningCollectionView = InningCollectionView(frame: .zero, collectionViewLayout: layout)
        inningCollectionView.register(InningCollectionViewCell.self, forCellWithReuseIdentifier: InningCollectionViewCell.identifier)
        inningCollectionView.dataSource = inningDataSource
        inningCollectionView.delegate = self
    }
    
    private func configureSubViews() {
        self.view.addSubview(gameHeaderView)
        self.view.addSubview(gameFieldView)
        self.view.addSubview(inningCollectionView)
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
            
            inningCollectionView.topAnchor.constraint(equalTo: gameFieldView.bottomAnchor),
            inningCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            inningCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            inningCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06),
            
        ]
        constraints.forEach { $0.isActive = true }
    }
}

extension PlayViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! InningCollectionViewCell
        cell.selected()
        // TODO: - 하단에 뷰 생성해서 걔한테 [1회] 셀이 선택되었다는 거 알려줘야 함
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? InningCollectionViewCell else { return }
        cell.deselected()
    }
    
}
