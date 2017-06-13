//
//  DataManager.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 14/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

// TAKEN FROM TUTORIAL



import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase


class DataManager {
    
    // so that we can use the Data Manager through out the application
    static let shared = DataManager()
    


    func getWeeklyQuestions(completion: (Data) -> Void){
        // we get the data from the url we made a path to
        let url = URL(string: "https://github.com/sph-huynh/sustainable-schools-quiz/raw/master/TempJSONStuff.json")

        let data = try! Data(contentsOf: url!)
        completion(data)
    }

}


