//
//  Request.swift
//  BaseballGame
//
//  Created by delma on 2020/05/07.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get, post, put, patch, delete
}

protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var bodyParams: [String : Any]? { get }
    var headers: [String : String]? { get }
}

extension Request {
    var method: HTTPMethod { return .get }
    var bodyParams: [String : Any]? { return nil }
    var headers: [String : String]? { return nil }
}

final class MockGameListRequest: Request {
    var path: String = "https://a2ce38a7-8dc6-4960-847e-fd40393fe743.mock.pstmn.io/games"
}

final class MockGameRoomEmptyRequest: Request {
    var path: String = ""
}
