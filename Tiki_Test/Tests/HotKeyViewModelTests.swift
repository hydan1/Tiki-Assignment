//
//  HotKeyViewModelTests.swift
//  Tiki_Test
//
//  Created by Hydan on 16/9/24.
//

import XCTest

class HotKeysViewModelTests: XCTestCase {
    
    var viewModel: HotKeysViewModel!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        viewModel = HotKeysViewModel()
        NetworkManager.shared = mockNetworkManager
    }
    
    override func tearDown() {
        viewModel = nil
        mockNetworkManager = nil
        super.tearDown()
    }
    
    func testFetchHotKeysSuccess() {
        // Arrange: Create mock response and set it
        let hotKeys = [HotKey(icon: "https://salt.tikicdn.com/cache/750x750/ts/product/fa/1d/33/98a0ed962d4b27b6526a93fac7aab192.png", name: "Sample Key")]
        let hotKeyResponse = HotKeyResponse(data: Data(items: hotKeys))
        mockNetworkManager.mockResult = .success(hotKeyResponse)
        
        let expectation = XCTestExpectation(description: "reloadView should be called on success")
        
        // Act: Set reloadView closure to fulfill the expectation
        viewModel.reloadView = {
            expectation.fulfill()
        }
        
        // Act: Call fetchHotKeys
        viewModel.fetchHotKeys()
        
        // Assert: Wait for expectation
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(viewModel.hotKeys.count, 1)
        XCTAssertEqual(viewModel.hotKeys.first?.name, "Sample Key")
    }
    
    func testFetchHotKeysFailure() {
        // Arrange: Create mock error and set it
        let mockError = NSError(domain: "TestError", code: 0, userInfo: nil)
        mockNetworkManager.mockResult = .failure(mockError)
        
        let expectation = XCTestExpectation(description: "onFetchFailed should be called on failure")
        
        // Act: Set onFetchFailed closure to fulfill the expectation
        viewModel.onFetchFailed = { error in
            XCTAssertEqual((error as NSError).domain, "TestError")
            expectation.fulfill()
        }
        
        // Act: Call fetchHotKeys
        viewModel.fetchHotKeys()
        
        // Assert: Wait for expectation
        wait(for: [expectation], timeout: 1.0)
    }
}
