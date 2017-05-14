//
//  QuizViewController.swift
//  Sustainable Schools
//
//  Created by Admin on 04/05/2017.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit
import Gloss
import Foundation

class QuizViewController: UIViewController {

    
    public var currentQuestion = 0
    public var correctAnswerPlacement:UInt32 = 0
    public var questionLimit = 1
    //to jump over the correct answer, we store this index
    public var incorrectAnswerIndex = 2


    @IBAction func AnswerButton(_ sender: AnyObject) {
        if (sender.tag == Int(correctAnswerPlacement)){
            print ("correct")
//            addPoints(repo.week)
        }
        else{
            print("wrong")
        }
        
        if (currentQuestion != questionLimit){
            displayQuestion()
        }
        
    }
    
    func addPoints(week: Int){
        
    }
    
    
    @IBOutlet weak var questionLabel: UILabel!

    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    // Question function
    func displayQuestion(){
        parseJSON()

        DataManager.shared.getWeeklyQuestions(){ data in
            guard let gloss = QNA(data: data) else{ return }
            questionLabel.text = gloss.easyQuestions[currentQuestion][0]
            
            correctAnswerPlacement = arc4random_uniform(4)+1

            var button:UIButton = UIButton()
            

            
            // we access each button by creating a new button with the tags set
            for buttonTag in 1...4{
                button = view.viewWithTag(buttonTag) as! UIButton
                
                if (buttonTag == Int(correctAnswerPlacement)){
                    button.setTitle(gloss.easyQuestions[currentQuestion][1], for: .normal)
                }
                else {
                    button.setTitle(gloss.easyQuestions[currentQuestion][incorrectAnswerIndex], for: .normal)
                    incorrectAnswerIndex += 1
                }
                
                
            }
            incorrectAnswerIndex = 2
            currentQuestion += 1
            questionLimit = gloss.easyQuestions.count
        }
        


    }
    
    func parseJSON(){
        print("Double checking me gloss works")
        
        DataManager.shared.getWeeklyQuestions(){ data in
            guard let gloss = QNA(data: data) else{ return }
            print("Week: \(gloss.week)")
            print("Points: \(gloss.easyPoints)")
            print("Points: \(gloss.mediumPoints)")
            print("Points: \(gloss.hardPoints)")
            print("Questions easy")
            print(gloss.easyQuestions)
            print("")
            print(gloss.easyQuestions[0][0])
            print("OK QUIZ TIME")
//            guard let easyQuestions = gloss.easyQuestions as? [[String: Any]] else{
//                return
//            }
//            print(easyQuestions)

//            print("Questions medium")
//            print(gloss.mediumQuestions)
//            print("Questions hard")
//            print(gloss.hardQuestions)
        
        
        
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        displayQuestion()

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
