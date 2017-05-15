//
//  HomepageViewController.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 2/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit
import QuartzCore
import FirebaseAuth


class HomepageViewController: UIViewController {
    
    var emailInput: String = "email.com"
    var passwordInput: String = "password"
    
    @IBOutlet weak var loginButton: UIButton!

    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var registerToggle: UIButton!
    
    // if you have an account, go straight into the app
    // if error print error in input
    @IBAction func authUser(){
        if let emailInput = emailLabel.text, let passwordInput = passwordLabel.text {
            FIRAuth.auth()?.signIn(withEmail: emailInput, password: passwordInput) { (user, error) in
                if error == nil {
                    //perform segue
                }
                else {
                    // print incorrect password or username
                }
            }
            
        }
        
    }
    
    // If you press this button,
    // we send email to register page
    // and it will ask for more details before registering
    @IBAction func registerToggleButton(){
        // perform segue
        // go to register page
    }
    
    
    

    // After display register page
    // Create new user, store info
    // Log in
    // Go to app
    func registerUser(email: String, password: String){
        print("I register user now")

        FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
            // ...
        }

    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

