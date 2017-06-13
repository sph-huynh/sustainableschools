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
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var confirmPasswordInput: UITextField!
    
    @IBOutlet var errorTextLabel: UILabel!

    var username: String = ""
    
    // After display register page
    // Create new user, store info
    // Log in
    // Go to app
    @IBAction func registerUser(){
        var invalidInput: Bool = false
        print("I register user now")
        guard case let email = emailInput.text, let password = passwordInput.text, let firstname = firstNameInput.text, let lastname = lastNameInput.text else{
            print("Input was not valid")
            self.errorLabelAppearAndDissapear(errorType: "invalidInput")
            invalidInput = true
            return
        }
        
        // check that the user has put the same password in the confirm password box
        guard case confirmPasswordInput.text! = passwordInput.text! else {
            self.errorLabelAppearAndDissapear(errorType: "passwordMismatch")
            invalidInput = true
            return
        }
        
        // validates the format of the email
        if ValidationManager.shared.validateEmail(emailToBeValidated: email!) == false {
            self.errorLabelAppearAndDissapear(errorType: "invalidEmail")
            invalidInput = true
        }
            
        // checks the length of the password
        else if ValidationManager.shared.validatePassword(passwordToBeValidated: password) == false {
            self.errorLabelAppearAndDissapear(errorType: "passwordLength")
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
                print("something went wrong")
                self.errorLabelAppearAndDissapear(errorType: "generic")
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
                        self.errorLabelAppearAndDissapear(errorType: "registration")
                        return
                    }
                    print("added user to database")
                })
                // go to the application if they are registered
                self.performSegue(withIdentifier: "quizViewConSegue", sender: nil)
                print("wair not yet")
            }
        }
    }
    
    // depending on the error, the correct message will appear above the email input box
    func errorLabelAppearAndDissapear(errorType: String){
        switch errorType {
        case "invalidInput":
            self.errorTextLabel.text = "Input was not valid!"
        case "passwordMismatch":
            self.errorTextLabel.text = "Password does not match!"
        case "passwordLength":
            self.errorTextLabel.text = "Password needs to be longer than 8 characters."
        case "invalidEmail":
            self.errorTextLabel.text = "Email was not of valid format!"
        case "registration":
            self.errorTextLabel.text = "Couldn't register. Please look over input."
        case "generic":
            self.errorTextLabel.text = "Something went wrong. Double check your internet connection"
        default:
            self.errorTextLabel.text = "Something went wrong"
        }
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
