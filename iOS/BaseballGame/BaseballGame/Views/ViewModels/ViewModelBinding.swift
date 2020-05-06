//
//  ViewModelBinding.swift
//  BaseballGame
//
//  Created by delma on 2020/05/06.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

protocol ViewModelBinding {
    associatedtype Key
    func perform(bind:@escaping (Key) -> ())
}
