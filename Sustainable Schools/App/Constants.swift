//
//  Constants.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 25/12/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import Foundation

struct Constants {
    struct Config {
        struct URLS {
            static let jsonQuestionsURL = "https://github.com/sph-huynh/sustainable-schools-quiz/raw/master/TempJSONStuff.json"
        }
        
        struct DatabaseStuffEeeek {
            struct Keys {
                static let totalPoints = "total-points"
                static let energyPoints = "energy-points"
            }
        }
    }
    
    struct Messages {
        struct Error {
            static let databaseError = "Couldn't update database"
            
            static let invalidInput = "Input was not valid!"
            static let noInput = "You did not input anything"
            
            static let passwordMismatch = "Password does not match!"
            static let passwordLength = "Password needs to be longer than 8 characters."
            static let invalidEmail = "Email was not of valid format!"
            static let invalidEmailOrPassword = "Incorrect password or username."
            
            static let genericRegistration = "Couldn't register. Please look over input."
            static let internet = "Something went wrong. Double check your internet connection"
            static let generic = "Something went wrong"
        }
    }
    
    struct Generic {
        struct Regex {
            static let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        }
    }
}

