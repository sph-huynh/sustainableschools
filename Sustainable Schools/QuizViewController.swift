//
//  QuizViewController.swift
//  Sustainable Schools
//
//  Created by Admin on 04/05/2017.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit
import Gloss

class QuizViewController: UIViewController {
    
    
    
    
    let questions = ["WAIT A MINITEHow many Sustainable Development Goals are there?", "What is Goal 1?", "What is Goal 3?"]
    let answers = [["17", "19", "8", "4"],["Producing less waste", "Using more solar", "Ensuring everybody has access to water", "End all forms of poverty everywhere"], ["Using clean and sustainable energy", "Building sustainable cities", "Using less energy", "Promoting gender equality"]]
    
    var currentQuestion = 0
    var correctAnswerPlacement:UInt32 = 0


    @IBAction func AnswerButton(_ sender: AnyObject) {
        if (sender.tag == Int(correctAnswerPlacement)){
            print ("correct")
//            addPoints(repo.week)
        }
        else{
            print("wrong")
        }
        
        if (currentQuestion != questions.count){
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
    
    
    func parseJSON(){
        

        
        guard let path = Bundle.main.path(forResource: "TempJSONStuff", ofType: "json") else {return }
        let url = URL(fileURLWithPath: path)
        
        var json: Any!
        do {
            let data = try Data(contentsOf: url)
            json = try JSONSerialization.jsonObject(with:data)
            print("JSON:::\(json)")
            
            //            guard let array = jsonData as? [Any] else { print("soz");return }
            //            print("array")
            //            print(array)
            //
            //            print("get into the array")
            //            for item in array {
            //                guard let itemDict = item as? [String: Any] else { return }
            //                guard let points = itemDict["points"] as? Int else { print("not an Int"); return}
            //                guard let questions = itemDict["qna"] as? String else { print("not an String"); return}
            //
            //                print(points)
            //                print(questions)
            //
            //                3
            //            }
            //            print("now we are out of the array")
            //            print(jsonData.value(forKey: "points"))
            //            var allValues: [Any] {get jsonData}
            //            print("We are accesing local json")
            //            print(allValues[0])
            

                

            
        }
        catch{
            print(error)
        }
    
        guard let dictionary = json as? [String: Any] else {
        print("Sorry couldn't initiliase Dictionary")
        return
            }
    
        guard let qna = QNA(json: dictionary) else{
            print("error initilising object")
            return
        }
        
        guard let firstItem = qna.week else{
            print("no such item")
            return
        }
        
        print("HERES THE FIRST ITEM")
        print(firstItem)
        

        

    }
    
    // Gloss JSON stuff
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        

        
        parseJSON()
        
        
        
        displayQuestion()


//        print(repo.week)
//        print(repo.points)
//        print(repo.qna)
//        print(" ")
        
//        print("JSON: \(repo.toJSON())")
//        print(" ")
//
//        guard let repos = [GlossSustainable].from(jsonArray: [repoJSON]) else{
//            print("OI 2 DECODING FAILURE")
//            return
//        }
//        
//        //
//        print(repos.week)
//        print(repos.points)
//        print(repos.qna)
//        print(" ")
//
//        print("REPOS: \(repos)")
//        print("")
//        
//        guard let jsonArray = repos.toJSONArray() else {
//            print("ENCODING FAILURE :(")
//            return
//        }
//        
//        print("JSON ARRAY: \(jsonArray)")
//        // Do any additional setup after loading the view.
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
