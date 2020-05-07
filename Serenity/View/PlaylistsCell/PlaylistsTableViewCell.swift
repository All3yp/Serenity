//
//  PlaylistsTableViewCell.swift
//  Serenity
//
//  Created by Alley Pereira on 5/6/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class PlaylistsTableViewCell: UITableViewCell {
    
    
    static let identifier = "playCardCell"

    @IBOutlet weak var musicNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
