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
    
    
    //variables to store points temp for functions
    var newTotalPoints: Int = 0
    
    var currentTotalPoints: Int = 0
    var currentPoints: Int = 0
    var currentLevel: Int = 1
    


    func getWeeklyQuestions(completion: (Data) -> Void){
        // we get the data from the url we made a path to
        let url = URL(string: "https://github.com/sph-huynh/sustainable-schools-quiz/raw/master/TempJSONStuff.json")

        let data = try? Data(contentsOf: url!)
        completion(data!)
    }
    
    // updates the database with the new points scored by user
    func updatePoints(pointValue: Int){
        
        let ref = FIRDatabase.database().reference()
        let usersDBRef = ref.child("users").child(FIRAuth.auth()!.currentUser!.uid)
        // these are the values I want to save into my database per creation of a new user
        self.newTotalPoints = getNewTotalPoints(pointValue: pointValue)
        self.currentPoints = pointValue
        let values = ["total-points": self.newTotalPoints, "energy-points": pointValue] as [String : Any]
        usersDBRef.updateChildValues(values, withCompletionBlock: { (err, ref) in
            if err != nil {
                print(err ?? "Couldn't update database")
                return
            }
        })
        
        
    }
    
    // just adds the newly set points with the current total points
    func getNewTotalPoints(pointValue: Int) -> Int{
        
        self.newTotalPoints = self.readTotalPoints() + pointValue
        
        return newTotalPoints
    }
    
    // reads what's currently stored in the firebase db in current points
    func readPoints() -> Int{
        let firRef = FIRDatabase.database().reference()
        let userRef = firRef.child("users/\(FIRAuth.auth()!.currentUser!.uid)")
        userRef.observe(.value, with: { (snapshot) in
            let user = User(snapshot: snapshot)
            self.currentPoints = user.currentPoints
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        return self.currentPoints
    }
    
    // reads what's currently stored in the firebase db in total points
    func readTotalPoints() -> Int{
        let firRef = FIRDatabase.database().reference()
        let userRef = firRef.child("users/\(FIRAuth.auth()!.currentUser!.uid)")
        userRef.observe(.value, with: { (snapshot) in
            let user = User(snapshot: snapshot)
            self.currentTotalPoints = user.currentTotalPoints
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        return self.currentTotalPoints
    }
    


    
}


