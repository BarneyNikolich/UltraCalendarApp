//
//  ViewController.swift
//  UltraCalendarApp
//
//  Created by Barney Nikolich on 03/04/2017.
//  Copyright © 2017 Barney Nikolich. All rights reserved.
//

import UIKit

class RaceProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var raceNameLabel: UILabel!
    @IBOutlet weak var raceLogoImage: UIImageView!
    @IBOutlet weak var infoTextView: UITextView!
    
    var race: Race? //Race variable is passed by 'RaceTableViewController' in 'prepareForSegue(sender)' func
    
    let raceCategories = ["Distance (mi)", "Date", "Climb (ft)", "Cost (£)", "Location"]
    

    //MARK: Table Delegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return raceCategories.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create custom cell
        let raceProfileCellIdentifier = "RaceProfileViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: raceProfileCellIdentifier, for: indexPath)
            as? RaceProfileViewCell
        else {
            fatalError("The dequeued cell is not an instance of RaceProfileViewCell")
        }
        
        //Get index of current table row
        let row = indexPath.row
        
        //Populate the Property Label with raceCategories Array defined in properties
        cell.racePropertyLabel.text = raceCategories[row]
                
        //Dynamically populate the category information based on category name
        switch(raceCategories[row]) {
            
            case "Distance (mi)":
                cell.raceInfoLabel.text = "\(race!.distance)"
            case "Climb (ft)":
                cell.raceInfoLabel.text = "\(race!.climb)"
            case "Date":
                cell.raceInfoLabel.text = race!.date
            case "Cost (£)":
                cell.raceInfoLabel.text = "\(race!.cost)"
            case "Location":
                cell.raceInfoLabel.text = "\(race!.location)"
            default:
                fatalError("Problem populating race properties in race profile UITable")
            }
        
        
        return cell
    }
    
    // MARK:  UITableViewDelegate Methods

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        print(raceCategories[row])
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
       
        // Set up views if editing an existing Meal.
        updateProfile()
    }
    
    
    //MARK: Private functions
    
    func updateProfile(){
        
        if let race = race {
            raceNameLabel.text = race.name
            navigationItem.title = race.name
            raceLogoImage.image = race.logo
            infoTextView.text = race.info
            

        } else {
            fatalError("Could not load race profile for \(race?.name)")
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

