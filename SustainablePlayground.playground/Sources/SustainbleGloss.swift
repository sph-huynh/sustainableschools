//
//  SustainbleGloss.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 7/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import Foundation
import Gloss

public struct SustainableGloss: Decodable {
    /**
     Returns new instance created from provided JSON.
     
     - parameter json: JSON representation of object.
     
     - returns: New instance when JSON parsing successful, false otherwise.
     */
    public let questions: Questions?
    
    public init?(json: JSON) {
        questions = "Questions" <~~ json
    }

    
    
}
