//
//  leadershipBoardViewController.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 13/6/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit
import Firebase



class leadershipBoardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet var userLevelLabel: UILabel!
    @IBOutlet var userFirstNameLabel: UILabel!
    @IBOutlet var userPointsLabel: UILabel!
    @IBOutlet var userAvatarImage: UIImageView!
    
    var selfLevel: Int = 0
    var userFirstName: String = "Bob"
    var userLevel: Int = 1
    
    @IBOutlet var collectionView: UICollectionView!
    
    // Cell variables
    
    var firstname: String = "placeholder"
    var level: Int = 1
    var totalPoints: Int = 1
    
    // Variables for Firebase DB Refrenc
    var ref = FIRDatabase.database().reference().child("users")
    var tempArray = [String]()
    
    // TEMP HARD CODED USER DB
    
    var users: [Int: [String]] = [
        
        0: ["Enough characters", "1","0"]

        
    ]
    
    func configureUserView(){
        
        switch self.userLevel {
        case 1:
        userAvatarImage.image = UIImage(named:"earthSad")
        case 2:
        userAvatarImage.image = UIImage(named:"energyEarth")
        case 3:
        userAvatarImage.image = UIImage(named:"energyLand")
        default:
        userAvatarImage.image = UIImage(named:"earthSad")
        }
    }
    
    func getUserDB(){
        // Refrence for accessing our database
        // Specifically the Users
        

        
        
        // Observe in the Users DB for the first name
//        usersDictionary.observeSingleEvent(of: .value, with: { (snapshot: FIRDataSnapshot) in
//            print("HI")
//
//            
//            // Get user value
////            let userDictionary = snapshot.value as! [String: String]
////            print("um herro")
//            print(usersDictionary)
//            self.firstname = snapshot.value?.objectForKey("firstname") as! String
//            print(self.firstname)
//
//        }) { (error) in
//        print("There was an error")
//        }
//        print(ref.child("users").child("uid"))

    }
    
//    
//    func setImage(cell: leadershipCollectionViewCell, level: Int){
//        
//        // Set firstname and level
//        userFirstNameLabel.text = userFirstName
//        userLevelLabel.text = userLevel
//        
//        // Set avatar based on level of user
//        
//        switch level {
//        case 1:
//            cell.imageView.image = UIImage(named:"earthSad")
//        case 2:
//            cell.imageView.image = UIImage(named:"energyEarth")
//        case 3:
//            cell.imageView.image = UIImage(named:"energyLand")
//        default:
//            cell.imageView.image = UIImage(named:"earthSad")
//        }
//    }
//    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureUserView()
        ref.observe(.value, with: { snapshot in
            print(snapshot.value!)
        })
        
//        ref.observe(.value, with: { snapshot in
//            var iteratorNum = 0
//            // create a dictionary with top users
//
//            // for each user add to the dictionary
//            for user in snapshot.children {
//                // 4
//                var firstname = snapshot.childSnapshot(forPath: "firstname") as! String
//                var level = snapshot.childSnapshot(forPath: "level") as! Int
//                var totalPoints = snapshot.childSnapshot(forPath: "total-points") as! Int
//
//                print(level)
//                print("firstname")
//                print(firstname)
//                print("total\(totalPoints)")
//                    
////                self.users[iteratorNum] = [level, firstname, totalPoints]
//                iteratorNum += 1
//            }
//            
//            
//            
//            // 5
//            print(self.users)
//            self.collectionView.reloadData()
//        })
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "leadershipCollectionViewCell")
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return users.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "leadershipCollectionViewCell", for: indexPath) as! leadershipCollectionViewCell
        
        print("MARCO")
        getUserDB()
        
        
        // Configure the cell

        cell.levelLabel.text = "2"
        cell.firstnameLabel.text = firstname
//        setImage(cell:cell, level: level)
        
        return cell
    }
    
    
}
