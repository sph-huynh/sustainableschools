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
        if emailLabel.text == "" || passwordLabel.text == "" {
            // alert nothing has been entered
            print("you didn't enter anything")
        }
        else {
            if let emailInput = emailLabel.text, let passwordInput = passwordLabel.text {
                FIRAuth.auth()?.signIn(withEmail: emailInput, password: passwordInput) { (user, error) in
                    if error == nil {
                        //perform segue
                        print(" ")
                        print(" ")
                        self.performSegue(withIdentifier: "loginToQuizSegue", sender: nil)
                        print("logged you in")
                    }
                    else {
                        print(" ")
                        print(" ")

                        print("incorrect password or username")
                    }
                }
            }
            
        }
        
    }
    
    // If you press this button,
    // we send email to register page
    // and it will ask for more details before registering
    @IBAction func registerToggleButton(){
        self.performSegue(withIdentifier: "loginToQuizSegue", sender: nil)
    }
    
    
    

 
    
    // Prepare segue for login
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "loginToQuizSegue"){
            if let loginToQuizSegue = segue.destination as? QuizViewController{
                // If you want to segue anything here's the syntax
                loginToQuizSegue.username = emailInput
            }
        }
        // Prepare segue for registration

        else if (segue.identifier == "registrationPageSegue"){
            if let loginToQuizSegue = segue.destination as? RegistrationViewController{
                // If you want to segue anything here's the syntax
                registrationPageSegue.username = emailInput
            }
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

