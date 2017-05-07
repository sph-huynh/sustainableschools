import Foundation

public struct App: Decodable {
    public let levelNumber: String
    public let difficulty: String
    public let qna: String
    
    public init?(json: JSON) {
        guard let container: JSON = "level" <~~ json, let points: JSON = "points" <~~ json, let questionsAndAnswers: JSON = "questionsAndAnswers" <~~ json else {
            return nil
        }
        
        
        guard let levelNumber: String = "levelNumber" <~~ container, let difficulty: String = "points" <~~ points, let qna: String = "questionsAndAnswers" <~~ questionsAndAnswers else {
            return nil
        }
        
        
        self.levelNumber = levelNumber
        self.difficulty = difficulty
        self.qna = qna
        
        
    }
}


//,
//
