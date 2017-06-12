//
//  detailedSDGViewController.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 11/6/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit

class detailedSDGViewController: UIViewController {
    
    
    @IBOutlet weak var goalNumber: UILabel!
    @IBOutlet weak var goalTitle: UILabel!
    @IBOutlet weak var goalImage: UIImageView!
    @IBOutlet weak var goalDescription: UILabel!
    
//    func configureView() {
//        //but we have to make sure we have the right monster before we set the labels
//        goalNumber.text = "Goal: \(goalNumber.text)"
//        print(goalNumber!)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        configureView()

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
