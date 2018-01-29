//
//  ValidationManager.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 20/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import Foundation


class ValidationManager {
    static let shared = ValidationManager()

    // just checks input for email against the normal format of xxx@xxx.xxx
    func validateEmail (emailToBeValidated: String) -> Bool {
        if emailToBeValidated != ""{
            print("validate this email\(emailToBeValidated)")
            let emailTest = NSPredicate(format:"SELF MATCHES %@", Constants.Generic.Regex.emailRegEx)
            let result = emailTest.evaluate(with: emailToBeValidated)
            return result
        }
        else{
            return false
        }
    }
    
    // checks for a password that is at least 8 characters
    func validatePassword (passwordToBeValidated: String) -> Bool {
        if passwordToBeValidated != "" && passwordToBeValidated.characters.count >= 8 {
            return true
        }
        else{
            print(Constants.Messages.Error.passwordLength)
            return false
        }
    }
}
