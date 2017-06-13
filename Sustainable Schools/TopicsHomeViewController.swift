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
    
    
    @IBOutlet var bgImage: UIImageView!

    var level1bg1: UIImage!
    var level1bg2: UIImage!
    var level1bg3: UIImage!
    var level1bg4: UIImage!
    
    var animation: [UIImage] = []
    
    var animatedBG: UIImage!
    
    func animateBG(){
        level1bg1 = UIImage(named: "level1bg1")
        level1bg2 = UIImage(named: "level1bg2")
        level1bg3 = UIImage(named: "level1bg3")
        level1bg4 = UIImage(named: "level1bg4")
        
        animation = [level1bg1, level1bg2, level1bg3, level1bg4]
        animatedBG = UIImage.animatedImage(with: animation, duration: 1.0)
        
        bgImage.image = animatedBG
    }
    
    
    
    @IBAction func logoutUser(){
        let firebaseAuth = FIRAuth.auth()
        
        do {
            try firebaseAuth?.signOut()
        }
          
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // animate the avatar
        animateBG()
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
