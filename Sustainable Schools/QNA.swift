import Foundation
import Gloss


struct QNA {
    
    let week: Int
    var easyPoints: Int
    var mediumPoints: Int
    var hardPoints: Int
    var easyQuestions: Array<Any>
    var mediumQuestions: Array<Any>
    var hardQuestions: Array<Any>
    let bossPoints: String
    

    
    init?(data: Data){
        let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]

        self.week = "week" <~~ json ?? 0
        let easyPoints = "points.easy" <~~ json ?? 0
        let mediumPoints = "points.medium" <~~ json ?? 0
        let hardPoints = "points.hard" <~~ json ?? 0
        self.easyPoints = easyPoints!
        self.mediumPoints = mediumPoints!
        self.hardPoints = hardPoints!

        let easyQuestions = "questions.easy" <~~ json ?? [["Error with Questions"]]
        let mediumQuestions = "questions.medium" <~~ json ?? [["Error with Questions"]]
        let hardQuestions = "questions.hard" <~~ json ?? [["Error with Questions"]]
        self.easyQuestions = [easyQuestions]
        self.mediumQuestions = [mediumQuestions]
        self.hardQuestions = [hardQuestions]
        self.bossPoints = "E: \(easyPoints!)M: \(mediumPoints!)H: \(hardPoints!)"


        
    }
    

}
