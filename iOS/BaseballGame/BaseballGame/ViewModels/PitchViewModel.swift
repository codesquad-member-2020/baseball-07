//
//  PitchViewModel.swift
//  BaseballGame
//
//  Created by delma on 2020/05/14.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

class PitchViewModel: ViewModelBinding {
    typealias Key = Pitch?
    typealias handler = (Pitch?) -> Void
    private var changedHandler: handler
    private var pitch: Key {
        didSet {
            changedHandler(pitch)
        }
    }
    
    init(pitch: Pitch? = nil, handler: @escaping handler) {
        self.pitch = pitch
        self.changedHandler = handler
        changedHandler(pitch)
    }
    
    func updateNotify(changed handler: @escaping handler) {
        self.changedHandler = handler
    }
    
}
