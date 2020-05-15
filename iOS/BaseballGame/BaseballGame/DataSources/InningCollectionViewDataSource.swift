//
//  InningCollectionViewDataSource.swift
//  BaseballGame
//
//  Created by delma on 2020/05/12.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class InningCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InningCollectionViewCell", for: indexPath) as! InningCollectionViewCell
        cell.set(inning: indexPath.row + 1)
        if indexPath.section == 0, indexPath.row == 0 { cell.selected() }
        guard let selected = collectionView.indexPathsForSelectedItems else { return cell }
        guard let selectedIndexPath = selected.first else { return cell }
        if selectedIndexPath == indexPath { cell.selected() } else { cell.deselected() }
        return cell
    }
    
    
}
