//
//  RegistrationViewController.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 26/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegistrationViewController: UIViewController {

    var username = "example"

    
    // After display register page
    // Create new user, store info
    // Log in
    // Go to app
    func registerUser(email: String, password: String){
        print("I register user now")
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print(" ")
                print(" ")
                
                print("sozz not correct")
            }
            else {
                print(" ")
                print(" ")
                
                print("go to screen with more info")
                //                segue to
            }
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
