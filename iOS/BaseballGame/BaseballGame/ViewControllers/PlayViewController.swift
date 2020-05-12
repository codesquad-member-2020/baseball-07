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
    private let inningDelegate = InningCollectionViewDelegate()
    
    private var inningHistoryCollectionView: AllInningHistoryCollectionView!
    private let inningHistoryDataSource = AllInningHistoryCollectionViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        configureInningCollectionView()
        configureInningHistoryCollectionView()
        configureSubViews()
        configureConstraints()
    }
    
    private func configureInningCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: view.frame.width / 3, height: 30)
        layout.scrollDirection = .horizontal
        inningCollectionView = InningCollectionView(frame: .zero, collectionViewLayout: layout)
        inningCollectionView.register(InningCollectionViewCell.self, forCellWithReuseIdentifier: InningCollectionViewCell.identifier)
        inningCollectionView.dataSource = inningDataSource
        inningCollectionView.delegate = inningDelegate
    }
    
    private func configureInningHistoryCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height / 2)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        inningHistoryCollectionView = AllInningHistoryCollectionView(frame: .zero, collectionViewLayout: layout)
        inningHistoryCollectionView.register(AllInningHistoryCollectionViewCell.self, forCellWithReuseIdentifier: AllInningHistoryCollectionViewCell.identifier)
        inningHistoryCollectionView.isPagingEnabled = true
        inningHistoryCollectionView.dataSource = inningHistoryDataSource
    }
    
    private func configureSubViews() {
        self.view.addSubview(gameHeaderView)
        self.view.addSubview(gameFieldView)
        self.view.addSubview(inningCollectionView)
        self.view.addSubview(inningHistoryCollectionView)
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
            
            inningHistoryCollectionView.topAnchor.constraint(equalTo: inningCollectionView.bottomAnchor, constant: 4),
            inningHistoryCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            inningHistoryCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            inningHistoryCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -4),
            inningHistoryCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ]
        constraints.forEach { $0.isActive = true }
    }
}
