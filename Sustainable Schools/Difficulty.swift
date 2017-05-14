//
//  points.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 13/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import Foundation
import Gloss

struct Points: Glossy{
    
    let easy: Int
    let medium: Int
    let hard: Int
    
    enum Language: String {
        case Swift = "Swift"
        case ObjectiveC = "Objective-C"
    }
    
    public init?(json: JSON){
        
        guard let easy: Int = "easy" <~~ json,
            let medium: Int = "medium" <~~ json,
            let hard: Int = "hard" <~~ json else{
                return nil
        }
        
        self.easy = easy
        self.medium = medium
        self.hard = hard
    }
    
    public func toJSON() -> JSON? {
        return jsonify(
            [
                "easy" ~~> self.easy,
                "medium" ~~> self.medium,
                "hard" ~~> self.hard
            ]
        )
    }

}
