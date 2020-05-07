//
//  ItemTableViewCell.swift
//  Serenity
//
//  Created by samuel sales on 06/05/20.
//  Copyright © 2020 Noyalle Pereira. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet var itemImage: UIImageView!
    
    @IBOutlet var itemLabel: UILabel!
    
    static let nibName = "ItemTableCell"
    static let identifier = "ItemCell"
    
    override func prepareForReuse() {
        itemImage.image = nil
        itemLabel.text = ""
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    func configure(){
        
    }
}

