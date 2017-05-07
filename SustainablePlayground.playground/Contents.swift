//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

// Ray Wenderlich tutorial used for utilising the Gloss framework
// https://www.raywenderlich.com/150322/swift-json-tutorial-2

PlaygroundPage.current.needsIndefiniteExecution = true
URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)

DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
    
    // Deserialise the data using JSONSerialise
    var json: Any
    do {
        json = try JSONSerialization.jsonObject(with: data)
    }
    catch {
        print(error)
        PlaygroundPage.current.finishExecution()
    }
    
    guard let dictionary = json as? [String: Any] else{
        PlaygroundPage.current.finishExecution()
    }
    
    // Initilise an instance of sustainableGloss by passing JSON Data into the constructor
    guard let sustainableGloss = SustainableGloss(json: dictionary) else {
        print("Error initialising object")
        PlaygroundPage.current.finishExecution()
    }
    
    // Grab first app by using the questions and level properties on the models that have been created
    guard let firstItem = sustainableGloss.questions?.level?.first else {
        print("No such item")
        PlaygroundPage.current.finishExecution()
    }
    
    print(firstItem)
    
    PlaygroundPage.current.finishExecution()
}
