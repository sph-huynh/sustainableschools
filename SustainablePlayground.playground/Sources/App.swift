import Foundation

public struct App: Decodable {
    public let questionList: String
    public let level: String
    public let answers: String
    
    public init?(json: JSON) {
        guard let container: JSON = "level" <~~ json, let points: JSON = "points" <~~ json else {
            return nil
        }
        
        guard let questionList: JSON = "questionList" <~~ json, let level: String = "points" <~~ points else {
            return nil
        }
        
//        guard let answers: JSON = "answers" <~~ json, let level: String = "points" <~~ points else {
//            return nil
//        }
        
        self.questionList = questionList
        self.level = level
        
    }
}


//,
//
