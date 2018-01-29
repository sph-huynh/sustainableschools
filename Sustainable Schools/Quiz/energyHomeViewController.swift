//
//  energyHomeViewController.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 2/6/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit


class energyHomeViewController: UIViewController {

    @IBOutlet var energyBG: UIImageView!
    
    var energybg1: UIImage!
    var energybg2: UIImage!
    
    var animation: [UIImage] = []
    
    var animatedBG: UIImage!
    
    func animatingEnergyBG(){
        energybg1 = UIImage(named: "energybg1")
        energybg2 = UIImage(named: "energybg2")
        
        animation = [energybg1, energybg2]
        animatedBG = UIImage.animatedImage(with: animation, duration: 2.0)
        
        energyBG.image = animatedBG
    }
    
    
    @IBOutlet var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animatingEnergyBG()
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
