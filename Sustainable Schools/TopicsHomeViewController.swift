//
//  TopicsHomeViewController.swift
//  Sustainable Schools
//
//  Created by Admin on 04/05/2017.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit
import Spring
import Firebase

class TopicsHomeViewController: UIViewController {

    // profile labels for total points and level
    @IBOutlet var userLevelLabel: UILabel!
    @IBOutlet var userPointsLabel: UILabel!

    
    // settings buttons
    @IBOutlet weak var aboutUsButton: UIButton!
    @IBOutlet weak var sdgPageButton: UIButton!
    @IBOutlet var logoutButton: UIButton!
    @IBOutlet weak var leadershipBoardButton: UIButton!
    
    // avatar
    @IBOutlet var bgImage: UIImageView!

    // variables for the diffrent frames in the background animation
    var level1bg1: UIImage!
    var level1bg2: UIImage!
    var level1bg3: UIImage!
    var level1bg4: UIImage!
    
    // an array for the above images to loop through
    var animation: [UIImage] = []
    
    // variable to save the animation in
    var animatedBG: UIImage!
    
    // variables for the points and level labels
    var userLabel = 1
    var userPoints = 1
    
    //sets the correct images to the variables and loops through each image
    func animateBG(){
        level1bg1 = UIImage(named: "level1bg1")
        level1bg2 = UIImage(named: "level1bg2")
        level1bg3 = UIImage(named: "level1bg3")
        level1bg4 = UIImage(named: "level1bg4")
        
        animation = [level1bg1, level1bg2, level1bg3, level1bg4]
        animatedBG = UIImage.animatedImage(with: animation, duration: 1.0)
        
        bgImage.image = animatedBG
    }
    
        
    func loadUserProfile(){
        let firRef = FIRDatabase.database().reference()
        let userRef = firRef.child("users/\(FIRAuth.auth()!.currentUser!.uid)")
        userRef.observe(.value, with: { (snapshot) in
            let user = User(snapshot: snapshot)
            self.userLevelLabel.text = "\(user.currentLevel!)"
            self.userPointsLabel.text = "\(user.currentTotalPoints!)"
 
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
    }

    

    
    // log out user
    @IBAction func logoutUser(){
        
        if FIRAuth.auth()!.currentUser != nil{
            do {
                try? FIRAuth.auth()?.signOut()
                
                if FIRAuth.auth()?.currentUser == nil{
                    // send them back to the home page when they have been logged out
                    exitAppToHomescreen()
                }
            }
        }
        else{
            print("Can't sign user out")
        }

        
        
    }
    
    // showing home page
    func exitAppToHomescreen(){
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let HomepageViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomepageViewController") as! HomepageViewController
        
        self.present(HomepageViewController, animated: false, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadUserProfile()
        // animate the avatar
        animateBG()
        
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        loadUserProfile()

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
