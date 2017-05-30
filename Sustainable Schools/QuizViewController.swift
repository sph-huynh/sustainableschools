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

    var username: String = ""
    public var currentQuestion = 0
    public var correctAnswerPlacement:UInt32 = 0
    public var questionLimit = 1
    //to jump over the correct answer, we store this index
    public var incorrectAnswerIndex = 2
    public var currentQuestionArray = [Array<String>]()
    public var difficultyLevels = 1
    public var currentPoints = 0
    public var currentWeek = 1
    public var accumulatedPoints = 0
    public var reachedLimit: Bool = false


    @IBAction func AnswerButton(_ sender: AnyObject) {
        if (sender.tag == Int(correctAnswerPlacement)){
            print ("correct")
            addPoints(week: currentWeek)
        }
        else{
            print("wrong")
        }
        
        if (currentQuestion != questionLimit){
            if (difficultyLevels < 3) {
                difficultyLevels += 1
                currentQuestion = 0
            }
            else{
                reachedLimit = true
                performSegue(withIdentifier: "displayingPointsSegue", sender: nil)
    //                questionLabel.text = String(accumulatedPoints)
                
            }
        }
        displayQuestion()

        
    }
    
    func addPoints(week: Int){
        accumulatedPoints += currentPoints
    }
    
    func animateAvatar(){
        
    }
    
    @IBOutlet weak var questionLabel: UILabel!

    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    // Question function
    func displayQuestion(){
        if reachedLimit != true{
        parseJSON()

        questionLabel.text = currentQuestionArray[currentQuestion][0]
        
        correctAnswerPlacement = arc4random_uniform(4)+1

        var button:UIButton = UIButton()
        

        
        // we access each button by creating a new button with the tags set
        for buttonTag in 1...4{
            button = view.viewWithTag(buttonTag) as! UIButton
            
            if (buttonTag == Int(correctAnswerPlacement)){
                button.setTitle(currentQuestionArray[currentQuestion][1], for: .normal)
            }
            else {
                button.setTitle(currentQuestionArray[currentQuestion][incorrectAnswerIndex], for: .normal)
                incorrectAnswerIndex += 1
            }
            
            
        }
        incorrectAnswerIndex = 2
        currentQuestion += 1
        questionLimit = (currentQuestionArray.count) - 1
    
        

        }
    }
    
    func parseJSON(){
        DataManager.shared.getWeeklyQuestions(){ data in
            guard let gloss = QNA(data: data) else{ return }
            currentWeek = gloss.week
            if (difficultyLevels == 1){
                currentQuestionArray = gloss.easyQuestions
                currentPoints = gloss.easyPoints
            }
            if (difficultyLevels == 2){
                currentQuestionArray = gloss.mediumQuestions
                currentPoints = gloss.mediumPoints

            }
            if (difficultyLevels == 3){
                currentQuestionArray = gloss.hardQuestions
                currentPoints = gloss.hardPoints

            }



        
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "displayingPointsSegue"){
            if let displayingPointsSegue = segue.destination as? displayingPointsViewController{
                displayingPointsSegue.accumulatedPoints = accumulatedPoints
                
            }
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
