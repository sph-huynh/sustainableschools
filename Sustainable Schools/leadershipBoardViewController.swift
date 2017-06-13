//
//  leadershipBoardViewController.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 13/6/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit



class leadershipBoardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    // TEMP HARD CODED USER DB
    
    var users: [String: String] = [
        "email": "test@test.com",
        "firstname": "Enough characters",
        "lastname": "In password",
        "level": "1",
        "energy-points": "0",
        "land-points": "0"
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        cell.level = Int(users["level"]!)!
        cell.firstname = users["firstname"]!
        // Configure the cell
        
        return cell
    }
    
}
