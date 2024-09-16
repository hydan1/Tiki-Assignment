//
//  HotKeysViewModel.swift
//  Tiki_Test
//
//  Created by Hydan on 16/9/24.
//

import Foundation

class HotKeysViewModel {
    
    var hotKeys: [HotKey] = []
    var reloadView: (() -> Void)?
    var onFetchFailed: ((Error) -> Void)?
    
    func fetchHotKeys() {
        NetworkManager.shared.request(target: API.fetchHotKeys, responseType: HotKeyResponse.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let hotKeyResponse):
                hotKeys = hotKeyResponse.data.items
                reloadView?()
            case .failure(let error):
                onFetchFailed?(error)
            }
        }
    }
}
