//
//  TargetType.swift
//  Tiki_Test
//
//  Created by Hydan on 16/9/24.
//

import Foundation

protocol TargetType {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: [String: String]? { get }
}

enum Task {
    case requestPlain
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}

enum ParameterEncoding {
    case url
    case json
}
