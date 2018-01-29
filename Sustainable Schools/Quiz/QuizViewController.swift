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

    
    
    // stores the current question, answer
    var currentQuestion = 0
    var correctAnswerPlacement:UInt32 = 0
    var questionLimit = 5
    //to jump over the correct answer, we store this index
    var incorrectAnswerIndex = 2
    var currentQuestionArray = [Array<String>]()
    var difficultyLevels = 1
    var currentPoints = 0
    var currentWeek = 1
    var accumulatedPoints = 0
    var reachedLimit: Bool = false

    
    // the quiz is formatted as
    //    week-no {
    //        difficulty-points: x,
    //        questions: [
    //            [question, correct answer, incorrect answer, incorrect answer, incorrect answer]
    //        ]
    //    
    //    }
    // the we always keep track of the correct answer in the array
    // if the user picks the answer with the index that corresponds, it is correct
    @IBAction func AnswerButton(_ sender: AnyObject) {
        if (sender.tag == Int(correctAnswerPlacement)){
            print ("correct")
            // we add points
            addPoints(week: currentWeek)
        }
        else{
            print("wrong")
        }
        
        // we need to make sure that we don't exceed the number of questions for that given difficulty
        if (self.currentQuestion == self.questionLimit){
            if (self.difficultyLevels < 3) {
                self.difficultyLevels += 1
                self.currentQuestion = 0
            }
            else{
                // and after going through the questions for each difficulty and levels of difficulty we segue back to 
                // the topics home vc
                self.reachedLimit = true
                
                
                DataManager.shared.updatePoints(pointValue: accumulatedPoints)

                // we segue to display points vc
                let mainStoryboard = UIStoryboard(name: "Quiz", bundle: nil)
                let displayingPointsViewController = mainStoryboard.instantiateViewController(withIdentifier: "displayingPointsViewController") as! displayingPointsViewController
                
                self.present(displayingPointsViewController, animated: false, completion: nil)
            }
        }
        // and then display the next question
        displayQuestion()
    }
    

    
    func addPoints(week: Int){
        // adding points to the total for that level
        print(currentPoints)
        self.accumulatedPoints += currentPoints
        
    }
    

    
    
    @IBOutlet weak var questionLabel: UILabel!

    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    // Question function
    func displayQuestion(){
        if reachedLimit != true{
            // this function adds the correct set of questions into the current array being used for the questions
            parseJSON()

        
            questionLabel.text = currentQuestionArray[currentQuestion][0]
            // a random index is chosen for the correct answer
            // because the correct answer is alway the first answer, we can always keep check of where this answer is
            self.correctAnswerPlacement = arc4random_uniform(4)+1
            // variable for the buttons we use
            var button:UIButton = UIButton()
            

            
            // we access each button by creating a new button with the tags set
            for buttonTag in 1...4{
                button = view.viewWithTag(buttonTag) as! UIButton
                // check if we are at the index where the correct answer should be
                if (buttonTag == Int(correctAnswerPlacement)){
                    button.setTitle(currentQuestionArray[currentQuestion][1], for: .normal)
                }
                else {
                    // otherwise iterate through the incorrect answers and add them
                    button.setTitle(currentQuestionArray[currentQuestion][incorrectAnswerIndex], for: .normal)
                    self.incorrectAnswerIndex += 1
                }
                
                
            }
            // reset the incorrect index
            self.incorrectAnswerIndex = 2
            // move to the next question
            self.currentQuestion += 1
            
        
            

        }
    }
    
    func parseJSON(){
        DataManager.shared.getWeeklyQuestions(){ data in
            guard let gloss = QNA(data: data) else{ return }
            self.currentWeek = gloss.week
            // depending on the difficulty level, load the correct array of questions and answers
            switch difficultyLevels {
                case 1:
                    self.currentQuestionArray = gloss.easyQuestions
                    self.currentPoints = gloss.easyPoints
                    print("points are now\(currentPoints)")
                    print(gloss.easyPoints)
                case 2:
                    self.currentQuestionArray = gloss.mediumQuestions
                    self.currentPoints = gloss.mediumPoints
                print("points are now\(currentPoints)")
                print(gloss.mediumPoints)
                case 3:
                    self.currentQuestionArray = gloss.hardQuestions
                    self.currentPoints = gloss.hardPoints
                print("points are now\(currentPoints)")
                print(gloss.hardPoints)
                default:
                    self.currentQuestionArray = gloss.easyQuestions
                    self.currentPoints = gloss.easyPoints
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
