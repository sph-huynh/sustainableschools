//
//  GlossSustainable.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 7/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import Foundation
import Gloss

public struct GlossSustainable: Glossy {
    /**
     Returns new instance created from provided JSON.
     
     - parameter json: JSON representation of object.
     
     - returns: New instance when JSON parsing successful, false otherwise.
     */
    //    public let questions: Questions?
    //
    //    public init?(json: JSON) {
    //        questions = "Questions" <~~ json
    //    }
    
    let week: Int
    let points: Int
    let qna: NSArray
    
    enum Language: String {
        case Swift = "Swift"
        case ObjectiveC = "Objective-C"
    }
    
    public init?(json: JSON){
        
        guard let week: Int = "week" <~~ json,
            let points: Int = "points" <~~ json,
            let qna: NSArray = "qna" <~~ json else{
                return nil
        }
        
        self.week = week
        self.points = points
        self.qna = qna
    }
    
    public func toJSON() -> JSON? {
        return jsonify(
            [
                "week" ~~> self.week,
                "difficulty" ~~> self.points,
                "qna" ~~> self.qna
            ]
        )
    }
}
