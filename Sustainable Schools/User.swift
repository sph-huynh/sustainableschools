//
//  User.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 2/6/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    var currentTotalPoints: Int!
    var currentPoints: Int!
    var currentLevel: Int!
    var userFirstname: String!
    
    // serves as a function that I can pass through
    init(snapshot: FIRDataSnapshot){

        currentTotalPoints = (snapshot.value! as! NSDictionary)["total-points"] as! Int
        currentPoints = (snapshot.value! as! NSDictionary)["energy-points"] as! Int
        currentLevel = (snapshot.value! as! NSDictionary)["level"] as! Int
        userFirstname = (snapshot.value! as! NSDictionary)["firstname"] as! String

    }
    


}
