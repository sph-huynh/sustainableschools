//
//  TopicsHomeViewController.swift
//  Sustainable Schools
//
//  Created by Admin on 04/05/2017.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit

class TopicsHomeViewController: UIViewController {

    @IBOutlet weak var quizButtonEnergy: UIButton!
    @IBOutlet weak var quizButtonFood: UIButton!
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testButton: UIButton!

    
    
    @IBAction func getGlossUser(_ sender: Any) {
        print("Here's the Gloss")
        DataManager.shared.getWeeklyQuestions(){ data in
//            let json = try! JSONSerialization.jsonObject(with: data, options: []) as! 
//            print(json)
            guard let gloss = QNA(data: data) else{ return }
            print("Week: \(gloss.week)")
            print(gloss.bossPoints)
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
