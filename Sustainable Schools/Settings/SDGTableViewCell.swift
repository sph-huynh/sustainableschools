//
//  SDGTableViewCell.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 30/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit

class SDGTableViewCell: UITableViewCell {
    
    
    // Labels linked from the table view
    @IBOutlet var goalName: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
