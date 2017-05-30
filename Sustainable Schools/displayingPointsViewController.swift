//
//  displayingPointsViewController.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 15/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit

class displayingPointsViewController: UIViewController {
    
    var accumulatedPoints = 0
    
    func moveBackToQuizVC(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.performSegue(withIdentifier: "goBackToQuizVCSegue", sender: nil)
        })
    }

    @IBOutlet weak var pointsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsLabel.text = String(accumulatedPoints)
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
