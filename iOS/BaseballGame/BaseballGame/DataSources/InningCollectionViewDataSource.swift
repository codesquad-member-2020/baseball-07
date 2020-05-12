//
//  InningCollectionViewDataSource.swift
//  BaseballGame
//
//  Created by delma on 2020/05/12.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class InningCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    // TODO: - 각 회차별 정보 가지고 있는 모델 필요. 연장전 갈수도 있으므로 셀 추가되어야 함.
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InningCollectionViewCell", for: indexPath) as! InningCollectionViewCell
        cell.set(inning: indexPath.row + 1)
        guard let selected = collectionView.indexPathsForSelectedItems else { return cell }
        guard let selectedIndexPath = selected.first else { return cell }
        if selectedIndexPath == indexPath { cell.selected() } else { cell.deselected() }
        return cell
    }
    
}
