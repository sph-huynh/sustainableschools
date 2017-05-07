import Foundation
import Gloss

struct QNA: Glossy {
    //    public let level: [App]?
    //
    //    public init?(json: JSON) {
    //        level = "level" <~~ json
    //    }
    let qnaQuestions: String?
    let qnaAnswers: NSArray?
    
    init?(json: JSON){
        guard let qnaQuestions: String = "questions" <~~ json else { return nil }
        self.qnaQuestions = qnaQuestions
        self.qnaAnswers = qnaAnswers
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "questions" ~~> self.qnaQuestions,
            "answers" ~~> self.qnaAnswers
            ])
    }
    
}
