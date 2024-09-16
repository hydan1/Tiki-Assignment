//
//  APIEndpoint.swift
//  Tiki_Test
//
//  Created by Hydan on 16/9/24.
//

import Foundation

enum API {
    case fetchHotKeys
}

extension API: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://run.mocky.io")!
    }
    
    var path: String {
        switch self {
        case .fetchHotKeys:
            return "/v3/146a98f0-76ad-42bb-b093-65f2bd4fd767"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchHotKeys:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .fetchHotKeys:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

