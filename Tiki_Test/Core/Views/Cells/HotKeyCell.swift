//
//  HotKeysCollectionViewCell.swift
//  Tiki_Test
//
//  Created by Hydan on 16/9/24.
//

import UIKit
import Kingfisher

class HotKeyCell: UICollectionViewCell {
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var hotKeyLabel: UILabel!
    @IBOutlet weak var containerLabelView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerLabelView.layer.cornerRadius = 6
        containerLabelView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.previewImageView.image = nil
    }
    
    public func configure(hotKey: HotKey, backgroundLabelColor: UIColor?) {
        if let url = URL(string: hotKey.icon) {
            previewImageView.kf.setImage(with: url)
        }
        let name = hotKey.name
        hotKeyLabel.numberOfLines = name.hasMoreThanOneWord() ? 2 : 1
        hotKeyLabel.text = hotKey.name
        containerLabelView.backgroundColor = backgroundLabelColor
    }
    
}
