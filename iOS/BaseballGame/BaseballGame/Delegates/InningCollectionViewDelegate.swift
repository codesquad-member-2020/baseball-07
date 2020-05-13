//
//  InningCollectionViewDelegate.swift
//  BaseballGame
//
//  Created by delma on 2020/05/12.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class InningCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! InningCollectionViewCell
        cell.selected()
        NotificationCenter.default.post(name: .selectInningCell, object: nil, userInfo: ["indexPath":indexPath])
        // TODO: - 하단에 뷰 생성해서 걔한테 [1회] 셀이 선택되었다는 거 알려줘야 함
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? InningCollectionViewCell else { return }
        cell.deselected()
    }
    
}
