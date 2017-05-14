import Foundation
import Gloss


struct QNA {
    //    public let level: [App]?
    //
    //    public init?(json: JSON) {
    //        level = "level" <~~ json
    //    }

    // From Gloss doco
    
//    let qnaQuestions: String?
//    let qnaAnswers: NSArray?
//    
//    init?(json: JSON){
//        self.qnaQuestions = "qna.questions" <~~ json
//        self.qnaAnswers = "qna.answers" <~~ json
//
//    }
//    
//    func toJSON() -> JSON? {
//        return jsonify([
//            "qna.questions" ~~> self.qnaQuestions,
//            "qna.answers" ~~> self.qnaAnswers
//            ])
//    }
    
    // Ray Wenderlich tutorial
    
//    let week: Int?
//    let points: Points?
//    let questions: Quiz?
//    
//    enum Language: String {
//        case Swift = "Swift"
//        case ObjectiveC = "Objective-C"
//    }
//    
//    init?(json: JSON){
//        self.week = "week" <~~ json
//        self.points = "points" <~~ json
//        self.questions = "questions" <~~ json
//    }
//    
//    func toJSON() -> JSON? {
//        return jsonify([
//            "week" ~~> self.week,
//            "points" ~~> self.points,
//            "questions" ~~> self.questions
//            ])
//    }
    
    let week: Int
    let bossPoints: String
//    let points: Points?
//    let questions: Quiz?
    
    
    init?(data: Data){
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//        let quizSus = json["questions"]
        
        self.week = "week" <~~ json ?? 0
        let easyPoints = "points.easy" <~~ json ?? 0
        let mediumPoints = "points.medium" <~~ json ?? 0
        let hardPoints = "points.hard" <~~ json ?? 0
        self.bossPoints = "E: \(easyPoints!)M: \(mediumPoints!)H: \(hardPoints!)"
    }
    

}
