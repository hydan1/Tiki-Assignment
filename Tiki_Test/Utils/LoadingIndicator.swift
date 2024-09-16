//
//  LoadingIndicator.swift
//  Tiki_Test
//
//  Created by Hydan on 16/9/24.
//

import UIKit

class LoadingIndicatorManager {
    
    static let shared = LoadingIndicatorManager()
    
    private var loadingView: UIView?
    
    private init() { }
    
    func showLoading(on viewController: UIViewController) {
        guard loadingView == nil else { return }
        
        let loadingView = UIView(frame: viewController.view.bounds)
        loadingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = loadingView.center
        activityIndicator.startAnimating()
        
        loadingView.addSubview(activityIndicator)
        viewController.view.addSubview(loadingView)
        
        self.loadingView = loadingView
    }
    
    func hideLoading() {
        guard let loadingView = loadingView else { return }
        loadingView.removeFromSuperview()
        self.loadingView = nil
    }
}
