//
//  detailedSDGViewController.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 8/6/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit

class detailedSDGViewController: UIViewController {
    
    var goalNum: String = "Goal ##"
    var sdgTitles = sdgReference.shared.sdgNames
    var sdgDictionary = sdgReference.shared.sdgDictionary
    
    @IBOutlet weak var goalNumber: UILabel!
    @IBOutlet weak var goalTitle: UILabel!
    @IBOutlet weak var goalImage: UIImageView!
    @IBOutlet weak var goalDescription: UILabel!
    
    
    func configureView() {
        //but we have to make sure we have the right monster before we set the labels
        goalNumber.text = "\(goalNum)"
        goalTitle.text = sdgTitles[goalNum]
        goalImage.image = UIImage(named:goalNum)
        goalDescription.text = sdgDictionary[goalNum]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
