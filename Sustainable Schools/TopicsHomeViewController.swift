//
//  TopicsHomeViewController.swift
//  Sustainable Schools
//
//  Created by Admin on 04/05/2017.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit
import Spring
import FirebaseAuth

class TopicsHomeViewController: UIViewController {

    @IBOutlet weak var startQuizButton: UIButton!
    @IBOutlet weak var quizButtonFood: UIButton!
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var level1Label: UILabel!
    
    // settings buttons
    @IBOutlet weak var aboutUsButton: UIButton!
    @IBOutlet weak var sdgPageButton: UIButton!
    @IBOutlet var logoutButton: UIButton!
    @IBOutlet weak var leadershipBoardButton: UIButton!
    

    @IBOutlet var pageSegmentControl: UISegmentedControl!
    
    @IBOutlet var avatarSad: SpringImageView!
    

    
    // Different buttons on the homescreen
    @IBAction func pageSegmentChanged(_ sender: UISegmentedControl) {
        switch pageSegmentControl.selectedSegmentIndex{
            case 0:
                // Show Homepage items
//                self.level1Label.isHidden = false
            
                //Hide settings labels
                self.aboutUsButton.isHidden = true
                self.sdgPageButton.isHidden = true
                self.leadershipBoardButton.isHidden = true
                self.logoutButton.isHidden = true
            case 1:
                // Hide Homepage items
//                self.level1Label.isHidden = true
            
                // Show settings labels
                self.aboutUsButton.isHidden = false
                self.sdgPageButton.isHidden = false
                self.leadershipBoardButton.isHidden = false
                self.logoutButton.isHidden = false
            default:
                break
        }
    }
    
    @IBAction func logoutUser(){
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    func animateAvatar(){
        avatarSad.delay = 0.5
        avatarSad.animation = "wobble"
        avatarSad.curve = "linear"
        avatarSad.duration = 1.0
        avatarSad.animate()
        print("animating now")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // animate the avatar
        
        animateAvatar()
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
