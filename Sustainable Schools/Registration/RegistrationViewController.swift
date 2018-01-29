//
//  RegistrationViewController.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 26/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {

    // outlets for interface
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var confirmPasswordInput: UITextField!

    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    
    @IBOutlet var errorTextLabel: UILabel!

    var username: String = ""
    
    // After display register page
    // Create new user, store info
    // Log in
    // Go to app
    @IBAction func registerUser(){
        var invalidInput: Bool = false
        guard case let email = emailInput.text, let password = passwordInput.text, let firstname = firstNameInput.text, let lastname = lastNameInput.text else{
                self.errorLabelAppearAndDissapear(errorType: Constants.Messages.Error.invalidInput)
                invalidInput = true
                return
        }
        
        // check that the user has put the same password in the confirm password box
        guard case confirmPasswordInput.text! = passwordInput.text! else {
            self.errorLabelAppearAndDissapear(errorType: Constants.Messages.Error.passwordMismatch)
            invalidInput = true
            return
        }
        
        // validates the format of the email
        if ValidationManager.shared.validateEmail(emailToBeValidated: email!) == false {
            self.errorLabelAppearAndDissapear(errorType: Constants.Messages.Error.invalidEmail)
            invalidInput = true
        }
            
        // checks the length of the password
        else if ValidationManager.shared.validatePassword(passwordToBeValidated: password) == false {
            self.errorLabelAppearAndDissapear(errorType: Constants.Messages.Error.passwordLength)
            invalidInput = true
        }
        // and if there are no flags that say the input was bad aka the invalidInput boolean
        // we try to create a new user
        if !invalidInput {
            createNewUser(email: email!, password: password, firstname: firstname, lastname: lastname)
            
        }
    }
    
    // creating a new user
    func createNewUser(email: String, password: String, firstname: String, lastname: String) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                self.errorLabelAppearAndDissapear(errorType: Constants.Messages.Error.generic)
            }
            else {
                
                guard let uid = user?.uid else{
                    return
                }

                
                // Initilising Firebase Database to use throughout the application
                
                let ref = FIRDatabase.database().reference(fromURL: "https://sustainable-schools.firebaseio.com/")
                
                let usersDBRef = ref.child("users").child(uid)
                // these are the values I want to save into my database per creation of a new user
                let values = ["email": email, "firstname": firstname, "lastname": lastname, "level": 1, "total-points": 0, "energy-points": 0, "land-points": 0] as [String : Any]
                usersDBRef.updateChildValues(values, withCompletionBlock: { (err, ref) in
                    if err != nil {
                        print(err ?? "Couldn't add user to database")
                        self.errorLabelAppearAndDissapear(errorType: Constants.Messages.Error.genericRegistration)
                        return
                    }
                    print("added user to database")
                })
                
                // go to the application if they are registered
                self.performSegue(withIdentifier: "quizViewConSegue", sender: nil)
            }
        }
    }
    
    // depending on the error, the correct message will appear above the email input box
    func errorLabelAppearAndDissapear(errorType: String){
        self.errorTextLabel.text = errorType
        self.errorTextLabel.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.errorTextLabel.isHidden = true
        })
    }
    
    // Prepare segue for login
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "quizViewConSegue"){
          }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
