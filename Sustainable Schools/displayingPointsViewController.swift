//
//  displayingPointsViewController.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 15/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit
import Spring

class displayingPointsViewController: UIViewController {
    
    @IBOutlet var congratulationsImage: UIImageView!
    var yay1: UIImage!
    var yay2: UIImage!
    var yay3: UIImage!

    var animation: [UIImage] = []
    
    var animatedYay: UIImage!
    
    func animatedYayImage(){
        yay1 = UIImage(named: "yay1")
        yay2 = UIImage(named: "yay2")
        yay3 = UIImage(named: "yay3")
        
        animation = [yay1, yay2, yay3]
        animatedYay = UIImage.animatedImage(with: animation, duration: 1.0)
        
        congratulationsImage.image = animatedYay
    }
    
    // reads what has just been stored in the firebase db and sets it as what is displayed
    func setPoints(){
        var accumulatedPoints = DataManager.shared.readPoints()
        pointsLabel.text = "\(accumulatedPoints)"
    }
    
    // segue back to topics home
    func moveBackToQuizVC(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let ScrollingTopicsViewController = mainStoryboard.instantiateViewController(withIdentifier: "ScrollingTopicsViewController") as! ScrollingTopicsViewController
            
            self.present(ScrollingTopicsViewController, animated: false, completion: nil)
        })
    }


    // just loading interface
    @IBOutlet weak var pointsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPoints()
        animatedYayImage()

        moveBackToQuizVC()
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
