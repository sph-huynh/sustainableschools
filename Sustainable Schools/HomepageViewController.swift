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
    
    @IBAction func authUser(){
        emailInput = emailLabel.text!
        passwordInput = passwordLabel.text!
        loginUser(email: emailInput, password: passwordInput)
    }
    
    @IBAction func registerToggleButton(){
        registerUser(email: emailInput, password: passwordInput)
    }
    
    func loginUser(email: String, password: String){
        print("I log you in now")
//        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
//            // ...
//        }
    }
    
    

    
    func registerUser(email: String, password: String){
        print("I register user now")

//        FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
//            // ...
//        }

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

