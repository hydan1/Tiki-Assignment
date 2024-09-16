//
//  ViewController.swift
//  Tiki_Test
//
//  Created by Hydan on 16/9/24.
//

import UIKit

class HotKeysViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let viewModel = HotKeysViewModel()
    private let colors = ["#16702e", "#005a51", "#996c00", "#5c0a6b", "#006d90", "#974e06", "#99272e", "#89221f", "#00345d"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingViewModel()
        setupCollectionView()
        LoadingIndicatorManager.shared.showLoading(on: self)
        viewModel.fetchHotKeys()
    }
    
    private func bindingViewModel() {
        viewModel.reloadView = { [weak self] in
            DispatchQueue.main.async {
                LoadingIndicatorManager.shared.hideLoading()
                self?.collectionView.reloadData()
            }
        }
        
        viewModel.onFetchFailed = { error in
            // Handle error here
            LoadingIndicatorManager.shared.hideLoading()
            print("Error: \(error.localizedDescription)")
        }
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "HotKeyCell", bundle: nil), forCellWithReuseIdentifier: "HotKeyCell")
    }
}

extension HotKeysViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.hotKeys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotKeyCell", for: indexPath) as! HotKeyCell
        let hotKey = viewModel.hotKeys[indexPath.item]
        let color = colors[indexPath.row % colors.count]
        cell.configure(hotKey: hotKey, backgroundLabelColor: UIColor(hex: color))
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = viewModel.hotKeys[indexPath.row].name
        var textWidth = text.width(withConstrainedHeight: 60, font: .systemFont(ofSize: 14))
        if text.hasMoreThanOneWord() {
            textWidth /= 2
        }
        let padding:CGFloat = 38
        return CGSize(width: textWidth + padding, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 16, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 16, height: collectionView.bounds.height)
    }
}
