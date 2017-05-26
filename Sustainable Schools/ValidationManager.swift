//
//  ValidationManager.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 20/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import Foundation


class ValidationManager {
    
    init (itemToBeValidated: String, keyOfItem: Int) {
        let typeOfItem = keyOfItem
        switch typeOfItem {
        case 1 :
            print("validate email")
        case 2 :
            print("validate password")
        default :
            print("You good")
        }
    }
    
    func validateEmail (emailToBeValidated: String) -> Bool {
        print("validate this email\(emailToBeValidated)")
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: emailToBeValidated)
        return result
    }
    
    func validatePassword (passwordToBeValidated: String) -> Bool {
        print("validate this password")
        if passwordToBeValidated.characters.count <= 7 {
            return true
        }
        else{
            return false
        }
    }
}
