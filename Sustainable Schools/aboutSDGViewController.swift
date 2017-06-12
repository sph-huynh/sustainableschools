//
//  aboutSDGViewController.swift
//  Sustainable Schools
//
//  Created by Sophia Huynh on 31/5/17.
//  Copyright © 2017 Sophia Huynh. All rights reserved.
//

import UIKit

class aboutSDGViewController: UIViewController , UITableViewDataSource{
    
    
    @IBOutlet var tableView: UITableView!

    // this is my dictionary of goals.
    // key is the goal number (Chronological order)
    // and the value is the description of the goal
    // Hard code the goals because they will never change
    var sdgDictionary = sdgReference.shared.sdgNames
    var sdg = [String]()
    var keys: [Any] = []
    var key: Any = "Goal"
    var selectedGoal = (0, "Goal Name")
    
    //    print(sdgDictionary.count)
    
    //    print(sdgDictionary["1"])
    
    // this is a var for the filtered data in an array
    var filtered = [String]()
    
    // making searchController programmatically
    let searchController = UISearchController(searchResultsController: nil)
    
    func filterContentForSearchText(searchText: String, scope: String = "All"){
        filtered = sdgDictionary.values.filter { sdg in
            return sdg.lowercased().contains(searchText.lowercased())
        }
        
        
        tableView.reloadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // a listener to see when text has changed
        searchController.searchResultsUpdater = self
        // dim view of table list when searching
        searchController.dimsBackgroundDuringPresentation = false
        // makes sure this view will disspear when we go to a different VC
        definesPresentationContext = true
        // and make sure this search bar is connected to the table view
        tableView.tableHeaderView = searchController.searchBar
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TABLE VIEW SET UP
    
    // MARK: - Table view data source
    //we only have one section in our table
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // That there's only one section of the table view
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filtered.count
        }
        return sdgDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SDGTableViewCell", for: indexPath) as! SDGTableViewCell
        
        // is a list of filtered or non filtered goals
        let dict = (sdgDictionary as NSDictionary)
        if searchController.isActive && searchController.searchBar.text != ""{
            // make it filtered
            sdg = [filtered[indexPath.row]]
            // DICT RETURNS AN [ANY] SO I HAVE TO GET IT OUT BEFORE PRINTING
            // Dictionaries in Swift don't have a find value for key function
            // So I have to convert a Swift Dictionary to a NSDictionary
            // Grab the key
            // Which is an array of [Any]
            // Grab the first and only item, and then print as is
            keys = dict.allKeys(for: sdg[0])
            key = keys[0]


        }
        else{
            // sdg is an array []()
            // sdg dictionary is a dictionary [:]
            // I want to make an array [with an array of indexpath]
            sdg = Array(sdgDictionary.values)
            sdg = [sdg[indexPath.row]]
            keys = dict.allKeys(for: sdg[0])
            key = keys[0]
        }
        cell.goalName?.text = ("\(key)")
        cell.descriptionLabel?.text = sdg[0]
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailedSDGsegue" {
            let dict = (sdgDictionary as NSDictionary)
            if let indexPath = tableView.indexPathForSelectedRow {
                if searchController.isActive && searchController.searchBar.text != "" {
                    sdg = [filtered[indexPath.row]]
                    keys = dict.allKeys(for: sdg[0])
                    key = keys[0]
                }
                else{
                    sdg = Array(sdgDictionary.values)
                    sdg = [sdg[indexPath.row]]
                    keys = dict.allKeys(for: sdg[0])
                    key = keys[0]
                    
                }
            //we are making sure we're sending to the right VC
            let detailedVC = (segue.destination as! detailedSDGViewController)
            print(" \(key)")
            detailedVC.goalNum = "\(key)"
            }
        }
    }
}
extension aboutSDGViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}
