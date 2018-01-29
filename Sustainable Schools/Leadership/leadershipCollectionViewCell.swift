//
//  leadershipCollectionViewCell.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 8/6/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit
import Firebase

class leadershipCollectionViewCell: UICollectionViewCell {
    // cell identifier leadershipBoardCell
    

    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pointLabel: UILabel!
    

    var ref = FIRDatabase.database().reference()
    
    func configureCell(user: User){
        self.firstnameLabel.text = user.userFirstname!
        self.levelLabel.text = "\(user.currentLevel!)"
        self.pointLabel.text = "Points: \(user.currentTotalPoints!)"
        configureImage(level: user.currentLevel)
    }
    
    func configureImage(level: Int){

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
    
    
    

}
