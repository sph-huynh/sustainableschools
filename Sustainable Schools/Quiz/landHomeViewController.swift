//
//  landHomeViewController.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 2/6/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit

class landHomeViewController: UIViewController {

    @IBOutlet var landBG: UIImageView!
    
    var landbg1: UIImage!
    var landbg2: UIImage!
    
    var animation: [UIImage] = []
    
    var animatedBG: UIImage!
    
    func animatingLandBG(){
        landbg1 = UIImage(named: "landbg1")
        landbg2 = UIImage(named: "landbg2")
        
        animation = [landbg1, landbg2]
        animatedBG = UIImage.animatedImage(with: animation, duration: 2.0)
        
        landBG.image = animatedBG
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animatingLandBG()

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
