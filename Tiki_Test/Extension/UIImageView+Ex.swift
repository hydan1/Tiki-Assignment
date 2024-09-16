//
//  UIImageView+Ex.swift
//  Tiki_Test
//
//  Created by Hydan on 16/9/24.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(from url: URL, shouldCache: Bool = true) {
        let skeletonView = UIView(frame: self.bounds)
        skeletonView.backgroundColor = UIColor.lightGray
        skeletonView.tag = 999
        self.addSubview(skeletonView)
        
        // cache option
        let cacheOptions: KingfisherOptionsInfo = shouldCache ? [] : [.forceRefresh]
        
        // Tải hình ảnh
        self.kf.setImage(with: url, options: cacheOptions) { [weak self] result in
            if let skeleton = self?.viewWithTag(999) {
                skeleton.removeFromSuperview()
            }
            
            switch result {
            case .success(let value):
                print("Image: \(value.image) | CacheType: \(value.cacheType)")
            case .failure(let error):
                print("Failed to load image: \(error.localizedDescription)")
            }
        }
    }
}
