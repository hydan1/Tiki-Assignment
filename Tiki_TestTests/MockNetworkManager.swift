//
//  MockNetworkManager.swift
//  Tiki_Test
//
//  Created by Hydan on 16/9/24.
//

import Foundation
import XCTest
@testable import Tiki_Test

// Create a mock NetworkManager
class MockNetworkManager: NetworkManager {
    
    var mockResult: Result<Any, Error>?
    
    override func request<T>(target: any TargetType, responseType: T.Type, completion: @escaping (Result<T, any Error>) -> Void) where T : Decodable {
        if let mockResult = mockResult as? Result<T, Error> {
            completion(mockResult)
        }
    }
}
