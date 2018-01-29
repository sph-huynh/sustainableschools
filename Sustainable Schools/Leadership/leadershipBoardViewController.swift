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
    
    
    var users = [User]()
    
    // depending on the level avatars will be different
    func configureUserAvatar(level: Int){
        switch level {
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
            self.configureUserAvatar(level: user.currentLevel!)
            
        }) { (error) in
            print(error.localizedDescription)
        }

    }
    
    
    func fetchLeadership(){
        ref.observe(.value, with: { (snapshot) in
            for user in snapshot.children{
                self.users.append(User(snapshot: user as! FIRDataSnapshot))
            }
            
            // sorting users by total points
            self.users = self.users.sorted(by: { (firstUser, secondUser) -> Bool in
                firstUser.currentTotalPoints > secondUser.currentTotalPoints
            })
            
            self.collectionView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchLeadership()
        loadUserProfile()
        
        print(users.count)
        
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
        return self.users.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "leadershipCollectionViewCell", for: indexPath) as! leadershipCollectionViewCell
        
        cell.configureCell(user: users[indexPath.row])
        
        return cell
    }
    

    
}
