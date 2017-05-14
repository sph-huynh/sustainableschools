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
    public var currentQuestionArray = [Array<String>]()
    public var difficultyLevels = 1


    @IBAction func AnswerButton(_ sender: AnyObject) {
        if (sender.tag == Int(correctAnswerPlacement)){
            print ("correct")
//            addPoints(repo.week)
        }
        else{
            print("wrong")
        }
        
        if (currentQuestion != questionLimit){
            if (difficultyLevels < 4) {
                difficultyLevels += 1
                currentQuestion = 0
            }
            else{
                // display finish screen
            }
        }
        displayQuestion()
        
    }
    
    func addPoints(week: Int){
        
    }
    
    
    @IBOutlet weak var questionLabel: UILabel!

    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    // Question function
    func displayQuestion(){
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
    
    func parseJSON(){
        DataManager.shared.getWeeklyQuestions(){ data in
            guard let gloss = QNA(data: data) else{ return }
            if (difficultyLevels == 1){
                currentQuestionArray = gloss.easyQuestions
            }
            if (difficultyLevels == 2){
                currentQuestionArray = gloss.mediumQuestions
            }
            if (difficultyLevels == 3){
                currentQuestionArray = gloss.hardQuestions
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
