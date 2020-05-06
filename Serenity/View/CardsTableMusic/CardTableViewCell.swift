//
//  CardTableViewCell.swift
//  Serenity
//
//  Created by Alley Pereira on 5/6/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    
    static let identifier = "cardsCell"
    
    @IBOutlet weak var imageCard: UIImageView!
    @IBOutlet weak var labelCard: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        self.imageCard.layer.cornerRadius = 11
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
