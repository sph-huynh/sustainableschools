//
//  leadershipCollectionViewCell.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 13/6/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit

class leadershipCollectionViewCell: UICollectionViewCell {
    // cell identifier leadershipBoardCell
    
    var firstname: String = "Unable to load name"
    var level: Int = 1
    
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configureView(){
        if firstname = firstname,
            level = level{
            setImage(level: level)
        }
        
    }
    
    func setImage(level: Int){
        switch level {
        case 1:
            imageView.image = UIImage(named:"earthSad")
        case 2:
            imageView.image = UIImage(named:"energyEarth")
        case 3:
            imageView.image = UIImage(named:"energyLand")
        default:
            imageView.image = UIImage(named:"earthSad")
        }
    }
    
    
    // TEMP HARD CODED USER DB
    
    var users: [String: String] = [
        "email": "test@test.com",
        "energy-points": "0",
        "firstname": "Enough characters",
        "lastname": "In password",
        "level": "1",
        "energy-points": "0",
        "land-points": "0"

    ]
}
