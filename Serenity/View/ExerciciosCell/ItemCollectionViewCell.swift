//
//  ItemCollectionViewCell.swift
//  Serenity
//
//  Created by samuel sales on 06/05/20.
//  Copyright © 2020 Noyalle Pereira. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    static let nibName = "ItemCollectionCell"
    static let identifier = "ItemCollectionCell"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.wrapperView.layer.cornerRadius = 10
        self.wrapperView.layer.masksToBounds = true
    }
    static func xibForCollection() -> UINib{
        return UINib(nibName: nibName, bundle: nil)
    }
}
