//
//  DataManager.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 14/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

// TAKEN FROM TUTORIAL



import Foundation

class DataManager {
    static let shared = DataManager()
    private init(){
    
    }


    func getWeeklyQuestions(completion: (Data) -> Void){
//        guard let path = Bundle.main.path(forResource: "TempJSONStuff", ofType: "json") else {return }
//        let url = URL(fileURLWithPath: path)
        // we get the data from the url we made a path to
        let url = URL(string: "https://github.com/sph-huynh/sustainable-schools-quiz/raw/master/TempJSONStuff.json")

        let data = try! Data(contentsOf: url!)
        completion(data)
    }

}


