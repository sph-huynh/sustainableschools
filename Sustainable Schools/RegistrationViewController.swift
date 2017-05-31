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


    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var confirmPasswordInput: UITextField!
    
    @IBOutlet var errorTextLabel: UILabel!
    @IBOutlet weak var registrationConfirm: UIButton!
    var username: String = ""
    
    // After display register page
    // Create new user, store info
    // Log in
    // Go to app
    @IBAction func registerUser(){
        print("I register user now")
        guard case let email = emailInput.text, let password = passwordInput.text, let firstname = firstNameInput.text, let lastname = lastNameInput.text else{
            print("Input was not valid")
            self.errorTextLabel.text = "Input was not valid!"
            self.errorTextLabel.isHidden = false
            return
        }

        if ValidationManager.shared.validateEmail(emailToBeValidated: email!) == false || ValidationManager.shared.validatePassword(passwordToBeValidated: password) == false{
            print("Email or password is invalid")
            self.errorTextLabel.text = "Password needs to be longer than 8 characters."
            self.errorTextLabel.isHidden = false
        }
        if confirmPasswordInput.text != passwordInput.text {
            self.errorTextLabel.text = "Password does not match!"
            self.errorTextLabel.isHidden = false
            self.errorLabelDissapear()
        }
        else {
            FIRAuth.auth()?.createUser(withEmail: email!, password: password) { (user, error) in
                if error != nil {
                    print("something went wrong")
                    self.errorTextLabel.text = "Something went wrong ):"
                    self.errorTextLabel.isHidden = false
                    self.errorLabelDissapear()
                }
                else {
                    
                    guard let uid = user?.uid else{
                        return
                    }
                    
                    // Initilising Firebase Database to use throughout the application
                    
                    let ref = FIRDatabase.database().reference(fromURL: "https://sustainable-schools.firebaseio.com/")
                    
                    let usersDBRef = ref.child("users").child(uid)
                    // these are the values I want to save into my database per creation of a new user
                    let values = ["email": email, "firstname": firstname, "lastname": lastname]
                    usersDBRef.updateChildValues(values, withCompletionBlock: { (err, ref) in
                        if err != nil {
                            print(err ?? "Couldn't add user to database")
                            self.errorTextLabel.text = "Couldn't register. Please look over input."
                            self.errorTextLabel.isHidden = false
                            return
                        }
                        print("added user to database")
                    })
                    
                    self.performSegue(withIdentifier: "quizViewConSegue", sender: nil)
                    print("wair not yet")
                }
            }
        }
        
    }
    
    func errorLabelDissapear(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.errorTextLabel.isHidden = true
        })
    }
    
    // Prepare segue for login
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "quizViewConSegue"){
  
            print("Lol what")
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
