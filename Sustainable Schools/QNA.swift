import Foundation
import Gloss


struct QNA {
    
    let week: Int
    let bossPoints: String
//    let points: Points?
//    let questions: Quiz?
    
    
    init?(data: Data){
        let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]

        self.week = "week" <~~ json ?? 0
        let easyPoints = "points.easy" <~~ json ?? 0
        let mediumPoints = "points.medium" <~~ json ?? 0
        let hardPoints = "points.hard" <~~ json ?? 0
        self.bossPoints = "E: \(easyPoints!)M: \(mediumPoints!)H: \(hardPoints!)"
    }
    

}
