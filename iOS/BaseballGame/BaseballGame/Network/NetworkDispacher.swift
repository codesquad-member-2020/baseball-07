//
//  NetworkDispatcher.swift
//  BaseballGame
//
//  Created by delma on 2020/05/07.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

protocol NetworkDispatcher {
    func execute(request: Request) -> Data
}
