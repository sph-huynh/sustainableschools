//
//  HomepageViewController.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 2/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit
import FirebaseAuth
import Spring

class HomepageViewController: UIViewController {
    

    
    @IBOutlet weak var loginButton: UIButton!

    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var registerToggle: UIButton!
    @IBOutlet weak var noAccountText: UILabel!
    
    @IBOutlet var errorLabel: UILabel!

    // animated logo variables
    @IBOutlet var earthLogo: SpringImageView!

    
    // perform the animation
    func animateEarthLogo() {
        earthLogo.animation = "swing"
        earthLogo.curve = "easeIn"
        earthLogo.duration = 1.0

        
    }
    
    func slideUpLogo(){
        earthLogo.animation = "slideUp"
        earthLogo.curve = "spring"
        earthLogo.duration = 1.0


        
    }
    
    func chainAnimation(){
        slideUpLogo()
        earthLogo.animate()
        animateEarthLogo()
        earthLogo.animate()
    }
    
    // show labels after a delay of 1 second
    func showLabels(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.emailLabel.isHidden = false
            self.passwordLabel.isHidden = false
            self.loginButton.isHidden = false
            self.registerToggle.isHidden = false
            self.noAccountText.isHidden = false
        })

    }

    func errorLabelDissapear(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.errorLabel.isHidden = true
        })
    }
    
    // if you have an account, go straight into the app
    // if error print error in input
    @IBAction func authUser(){
        guard case let email = emailLabel.text, let password = passwordLabel.text else{
            print("Input was not valid")
            return
        }
        if emailLabel.text == "" || passwordLabel.text == "" {
            // alert nothing has been entered
            errorLabel.text = "You didn't enter anything."
            self.errorLabel.isHidden = false
        }
        else {
                FIRAuth.auth()?.signIn(withEmail: email!, password: password) { (user, error) in
                    if error == nil {
                        //perform segue
                        print(" ")
                        print(" ")
                        self.performSegue(withIdentifier: "loginToQuizSegue", sender: nil)
                        print("logged you in")
                    }
                    else {
                        self.errorLabel.text = "Incorrect password or username."
                        self.errorLabel.isHidden = false
                        print("incorrect password or username")
                    }
                }
        }

    }
    
    // If you press this button,
    // we send email to register page
    // and it will ask for more details before registering
    @IBAction func registerToggleButton(){
        performSegue(withIdentifier: "registrationPageSegue", sender: nil)
    }
    
    
    

 
    
    // Prepare segue for login
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "loginToQuizSegue"){
            if let loginToQuizSegue = segue.destination as? QuizViewController{
                // If you want to segue anything here's the syntax
                loginToQuizSegue.username = emailLabel.text!
            }
        }
        // Prepare segue for registration

        else if (segue.identifier == "registrationPageSegue"){
            if let registrationPageSegue = segue.destination as? RegistrationViewController{
                // If you want to segue anything here's the syntax
                registrationPageSegue.username = emailLabel.text!
            }
            print("but you're not supposed to be here")
        }
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // delay label by 5 seconds
        showLabels()
        // animate the logo as soon as the app loads
        chainAnimation()
        

        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

