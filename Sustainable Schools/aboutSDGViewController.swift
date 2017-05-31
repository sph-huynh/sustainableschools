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
    var sdgDictionary: [String: String] = [
        "Goal 1" : "End poverty in all its forms everywhere",
        "Goal 2" : "End hunger, achieve food security and improved nutrition and promote sustainable agriculture",
        "Goal 3" : "Ensure healthy lives and promote well-being for all at all ages",
        "Goal 4": "Quality Education",
        "Goal 5": "Gender Equality",
        "Goal 6": "Clean Water and Sanitation",
        "Goal 7": "Affordable and Clean Energy",
        "Goal 8": "Decent Work and Economic Growth",
        "Goal 9": "Industry, Innovation and Infrastructure",
        "Goal 10": "Reduced Inequalities",
        "Goal 11": "Sustainable Cities and Communities",
        "Goal 12": "Responsible Consumption and Production",
        "Goal 13": "Climate Action",
        "Goal 14": "Life Below Water",
        "Goal 15": "Life on Land",
        "Goal 16": "Peace, Justice and Strong Institutions",
        "Goal 17": "Partnerships for the Goals"
    ]
    var sdg = [String]()
    var keys: [Any] = []
    var key: Any = "Goal"
    
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
        print("Am I even here yet")
        if searchController.isActive && searchController.searchBar.text != ""{
            // make it filtered
            sdg = [filtered[indexPath.row]]
            // DICT RETURNS A FKN [ANY] SO I HAVE TO GET IT OUT BEFORE PRINTING
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
            print(sdg)
        }
        cell.goalName?.text = ("\(key)")
        cell.descriptionLabel?.text = sdg[0]
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension aboutSDGViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}
