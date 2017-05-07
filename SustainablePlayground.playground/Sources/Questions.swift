import Foundation

public struct Questions: Decodable {
    public let level: [App]?
    
    public init?(json: JSON) {
        level = "level" <~~ json
    }
}
