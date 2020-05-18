//
//  AllInningHistoryCollectionViewDataSource.swift
//  BaseballGame
//
//  Created by delma on 2020/05/12.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class AllInningHistoryCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private var pitchHistory: PitchHistory!
    
    init(pitchHistory: PitchHistory) {
        self.pitchHistory = pitchHistory
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllInningHistoryCollectionViewCell", for: indexPath) as! AllInningHistoryCollectionViewCell
        if pitchHistory.pitchHistory.count > indexPath.row {
            cell.set(histories: pitchHistory.pitchHistory[indexPath.row].histories)
        }else {
            cell.showInfoView()
        }
        return cell
    }
}
