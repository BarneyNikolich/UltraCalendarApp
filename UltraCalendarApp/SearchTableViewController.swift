//
//  SearchTableViewController.swift
//  UltraCalendarApp
//
//  Created by Barney Nikolich on 10/05/2017.
//  Copyright © 2017 Barney Nikolich. All rights reserved.
//

import UIKit

enum selectedScope: Int {
    case Name = 0
    case Distance = 1
    case Cost = 2
    case Location = 3
}

class SearchTableViewController: UITableViewController, UISearchBarDelegate {

    var racesArray = AppDataHelper.getRaceArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBarSetup()
    }
    
//    // MARK: Search bar delegate method
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            racesArray = AppDataHelper.getRaceArray()
            self.tableView.reloadData()
        } else  {
            filterTableView(index: searchBar.selectedScopeButtonIndex, text: searchText)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        racesArray = AppDataHelper.getRaceArray() //Reset the filtered array when search button is pressed. Essentially searching again.
        filterTableView(index: searchBar.selectedScopeButtonIndex, text: searchBar.text!.lowercased())
    }
    
    //Logic for search functioanlity based on enum (category)
    func filterTableView(index: Int, text: String){
        switch index {
        case selectedScope.Name.rawValue:
            racesArray = racesArray.filter({ (race) -> Bool in
                return race.name.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
            
        case selectedScope.Distance.rawValue:
            racesArray = racesArray.filter({ (race) -> Bool in
                return "\(race.distance)".lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
            
        case selectedScope.Cost.rawValue:
            racesArray = racesArray.filter({ (race) -> Bool in
                return "\(race.cost)".lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()

        case selectedScope.Location.rawValue:
            racesArray = racesArray.filter({ (race) -> Bool in
                return race.location.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        default:
            fatalError("Selected search category not found!")
        }
    }
    
    func searchBarSetup() {
        let searchBar = UISearchBar(frame: CGRect(x:0, y:0, width:(UIScreen.main.bounds.width), height:70))
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Name", "Distance", "Cost", "Location"]
        searchBar.selectedScopeButtonIndex = 0 //set iniital selected scope
        searchBar.delegate = self
        
        self.tableView.tableHeaderView = searchBar
    }
   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return racesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cellIndentifier = "SearchTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as? SearchTableViewCell else {
            fatalError("The dequeued cell is not an instance of SearchTableViewCell")
        }
        
        let race = racesArray[indexPath.row]

//         Configure the cell...
        cell.label.text = race.name
        cell.cost.text = "£\(race.cost)"
        cell.distance.text = "\(race.distance) mi"
        cell.location.text = race.location


        return cell
    }
    
    //Func handles transition segue from table view of races to race profile view - passes accross race object
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "selectedRace":
            guard let raceProfileViewController = segue.destination as? RaceProfileViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedRaceCell = sender as? SearchTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedRaceCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            //find selected Race in the objectsArray Struct defined in Properties
            let selectedRace = racesArray[indexPath.row]
            
            raceProfileViewController.race = selectedRace
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }

    
}
