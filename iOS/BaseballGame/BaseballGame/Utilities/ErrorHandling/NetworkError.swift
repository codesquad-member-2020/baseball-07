//
//  NetworkError.swift
//  BaseballGame
//
//  Created by delma on 2020/05/07.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    case InvalidURL
    case DecodeError
    case EncodeError
    
    var description: String {
        switch self {
        case .InvalidURL:
            return "유효하지 않은 URL입니다"
        case .DecodeError:
            return "올바른 Decode 형식이 아닙니다"
        case .EncodeError:
            return "올바른 Encode 형식이 아닙니다"
        }
    }
}
