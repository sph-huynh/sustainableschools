//
//  QuizViewController.swift
//  Sustainable Schools
//
//  Created by Admin on 04/05/2017.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    let questions = ["How many Sustainable Development Goals are there?", "What is Goal 1?", "What is Goal 3?"]
    let answers = [["17", "19", "8", "4"],["Producing less waste", "Using more solar", "Ensuring everybody has access to water", "End all forms of poverty everywhere"], ["Using clean and sustainable energy", "Building sustainable cities", "Using less energy", "Promoting gender equality"]]
    
    var currentQuestion = 0
    var correctAnswerPlacement:UInt32 = 0


    @IBAction func AnswerButton(_ sender: AnyObject) {
        if (sender.tag == Int(correctAnswerPlacement)){
            print ("correct")
        }
        else{
            print("wrong")
        }
        
        if (currentQuestion != questions.count){
            displayQuestion()
        }
        
    }
    
    
    @IBOutlet weak var questionLabel: UILabel!

    
    override func viewDidAppear(_ animated: Bool) {
        displayQuestion()
        
    }
    
    // Question function
    func displayQuestion(){
        questionLabel.text = questions[currentQuestion]
        
        correctAnswerPlacement = arc4random_uniform(4)+1
        
        var button:UIButton = UIButton()
        
        //to jump over the correct answer, we store this index
        var incorrectAnswerIndex = 1
        
        // we access each button by creating a new button with the tags set
        for j in 1...4{
            button = view.viewWithTag(j) as! UIButton
            
            if (j == Int(correctAnswerPlacement)){
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else {
                button.setTitle(answers[currentQuestion][incorrectAnswerIndex], for: .normal)
                incorrectAnswerIndex = 2
            }
            
            
        }
        currentQuestion += 1

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
