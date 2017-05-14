//
//  Quiz.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 13/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import Foundation
import Gloss

struct Quiz: Glossy{
    
    let easy: NSObject
    let medium: NSObject
    let hard: NSObject
    
    enum Language: String {
        case Swift = "Swift"
        case ObjectiveC = "Objective-C"
    }
    
    public init?(json: JSON){
        
        guard let easy: NSObject = "easy" <~~ json,
            let medium: NSObject = "medium" <~~ json,
            let hard: NSObject = "hard" <~~ json else{
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
