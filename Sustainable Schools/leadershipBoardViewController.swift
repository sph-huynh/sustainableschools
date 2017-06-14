//
//  leadershipBoardViewController.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 8/6/17.
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
    
    var users = [User]()
    
    // depending on the level avatars will be different
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
    
    func loadUserProfile(){
        let firRef = FIRDatabase.database().reference()
        let userRef = firRef.child("users/\(FIRAuth.auth()!.currentUser!.uid)")
        userRef.observe(.value, with: { (snapshot) in
            let user = User(snapshot: snapshot)
            self.userFirstNameLabel.text = "\(user.userFirstname!)"
            self.userLevelLabel.text = "\(user.currentLevel!)"
            self.userPointsLabel.text = "\(user.currentTotalPoints!)"
            
        }) { (error) in
            print(error.localizedDescription)
        }

    }
    
    
    func setImage(cell: leadershipCollectionViewCell, level: Int){
        
        // Set firstname and level
        userFirstNameLabel.text = userFirstName
        userLevelLabel.text = "\(userLevel)"
        
        // Set avatar based on level of user
        
        switch level {
        case 1:
            cell.imageView.image = UIImage(named:"earthSad")
        case 2:
            cell.imageView.image = UIImage(named:"energyEarth")
        case 3:
            cell.imageView.image = UIImage(named:"energyLand")
        default:
            cell.imageView.image = UIImage(named:"earthSad")
        }
    }
    
    func fetchLeadership(){
        ref.observe(.value, with: { (snapshot) in
            for user in snapshot.children{
                self.users.append(User(snapshot: user as! FIRDataSnapshot))
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        
        users = users.sorted(by: { (u1, u2) -> Bool in
            u1.currentTotalPoints > u2.currentTotalPoints
        })
        
        self.collectionView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUserProfile()
        fetchLeadership()
        configureUserView()

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
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
        
        cell.configureCell(user: users[indexPath.row])
        
        return cell
    }
    
    
}
